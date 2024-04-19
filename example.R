get_lm_response <- function(message, model) {
  # sends off the message/prompt
  # returns the plain text
  return("Hello World!")
}

load_ratings <- function(path) {
  return()
}

get_irr <- function(ratings1, ratings2) {
  # done!
  return(0.47)
}

join_prompt_and_ratings <- function(prompt, human_ratings) {
  # returns a single string (Probably very long)
  # which joins, the prompt with the text responses from participants
  # Good option: prompt\nID,text\nID,text\n <===
  # Alternative: primot\n\n\nID:text\m
  # Not so good option: prompt ID,text,ID,text,ID,text,ID,text,ID,text,ID,text,...
  # 
  returns(super_l)
}

get_irr_for_prompt <- function(prompt, model, ratings_path) {
  # 1. loads a rating file <= done
  human_ratings <- load_ratings(ratings_path)
  # 2. Joins the prompt & non-rated fields in a sensible way
  message <- join_prompt_and_ratings(prompt, human_ratings)
  # 3. Sends that off to OpenAI <= done
  response <- get_lm_response(message, model)
  # 4. Parsing (!) (makes sense) of response
  open_ai_ratings <- parse_response(response)
  # 5. Compute inter-rater-reliability <= done! between ratings & OpenAI response
  irr <- get_irr(open_ai_ratings, human_ratings)
  # 6. Returns the inter-rate-reliability.
  return (0.1)
}