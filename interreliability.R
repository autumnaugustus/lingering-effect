 Function to read ratings from CSV file
read_ratings <- function(path_to_ratings) {
  # Read the CSV file
  ratings <- read.csv(path_to_ratings)
  return(ratings)
}

# Function to do inter rater reliability
interrater_reliability <- function(ratings_1, ratings_2) {
  # Match ratings based on participantID
  matched_ratings <- merge(ratings_1, ratings_2, by = "participantID", suffixes = c("_rater1", "_rater2"))
  
  #  agreement based on matching tags
  matched_ratings$agreement <- ifelse(matched_ratings$tags_rater1 == matched_ratings$tags_rater2, 1, 0)
  
  #  average agreement
  avg_agreement <- mean(matched_ratings$agreement)
  
  return(avg_agreement)
}


# Read ratings from CSV files
ratings_1 <- read_ratings("wcg_strategy_neutralcue_ariana.csv")
ratings_2 <- read_ratings("wcg_strategy_neutralcue_autumn.csv")

# do inter rater reliability
reliability <- interrater_reliability(ratings_1, ratings_2)
print(paste("Interrater reliability:", reliability))

# Check for participant IDs that are present in ratings_1 but not in ratings_2
 missing_ids_in_ratings_2 <- setdiff(ratings_1$participantID, ratings_2$participantID)
 print(missing_ids_in_ratings_2)
integer(0)

 # Check for participant IDs that are present in ratings_2 but not in ratings_1
 missing_ids_in_ratings_1 <- setdiff(ratings_2$participantID, ratings_1$participantID)
print(missing_ids_in_ratings_1)
integer(0)

# Check for duplicate participant IDs in ratings_1
duplicated_ids_in_ratings_1 <- ratings_1[duplicated(ratings_1$participantID), "participantID"]
 print(duplicated_ids_in_ratings_1)
integer(0)
 
 # Check for duplicate participant IDs in ratings_2
 duplicated_ids_in_ratings_2 <- ratings_2[duplicated(ratings_2$participantID), "participantID"]
print(duplicated_ids_in_ratings_2)
integer(0)
 
# Check the number of rows in ratings_1 and ratings_2
nrow_ratings_1 <- nrow(ratings_1)
 nrow_ratings_2 <- nrow(ratings_2)

   print(nrow_ratings_1)
 80
 print(nrow_ratings_2)
 80
 
 # Match ratings based on participantID and compare tags
matched_ratings <- merge(ratings_1, ratings_2, by = "participantID", suffixes = c("_1", "_2"))
 
 #  agreement
 matched_ratings$agreement <- as.integer(matched_ratings$wcg_strategy_group_1 == matched_ratings$wcg_strategy_group_2)

 # Compute inter rater reliability
 reliability <- mean(matched_ratings$agreement)
 print(reliability)
 0.675
