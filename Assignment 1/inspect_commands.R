reference_url <- "https://git-scm.com/docs"
output_file <- "scraped_git_commands.txt"

# Download the documentation index and read it into R.
download.file(reference_url, output_file, mode = "wb", quiet = TRUE)
scraped_git_commands <- readLines(output_file, warn = FALSE, encoding = "UTF-8")
cat("Downloaded", length(scraped_git_commands), "lines from the Git documentation index.\n")

#Create a dataframe with a list of git commands
important_commands <- data.frame(
	command = c("git clone", "git status", "git add", "git commit", "git push", "git teleport"),
	description = c(
		"Copy a repository from GitHub to your computer",
		"Show which files have changed",
		"Choose changes to include in the next commit",
		"Save a snapshot of staged changes",
		"Send commits from your computer to GitHub",
		"This command is fictional and is not part of Git"
	),
	stringsAsFactors = FALSE
)
command_links <- paste0("git-", sub("git ", "", important_commands$command))

# TODO: add a status column showing whether each command appears on the page.
# important_commands$status <- vapply(command_links, function(link) any(grepl(link, scraped_git_commands, fixed = TRUE)), logical(1))

print(important_commands, row.names = FALSE)
#This command should print 3 different columns, command, description and status. The last status should be FALSE