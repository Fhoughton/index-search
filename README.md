# Index-search
A multithreaded list search that provides power and speed.

## Functions

(**get-file** *filename*) - Returns the lines of the file as a list

(**search-for-words-simple** *lines* *wordlist*) - Searches for every search term in wordlist through a whole list.

(**starts-with** *string* *prefix*) - Returns true if a string starts with a certain prefix.

(**dosort** *list* *substr*) - Sorts a list so items with a certain substring at the start appear first.

(**search-index** *lines* *wordlist*) - Searches a list for items in the wordlist and orders it so items that start with a search term appear first, with those that start with the earliest term and a dot appearing first.

(**handle-search** *search*) - Converts a string of user input into a list that can be processed by search-for-words-simple and search-index.
