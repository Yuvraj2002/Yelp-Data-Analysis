mport os
import json

# Define paths
input_file = "/Users/yuvraj/Desktop/Yelp_Data_Analysis/Yelp JSON/yelp_dataset/yelp_academic_dataset_review.json"
output_folder = "Yelp JSON/yelp_dataset/split_reviews"

# Create the output folder if it doesn't exist
os.makedirs(output_folder, exist_ok=True)

# Read the input JSON file
with open(input_file, 'r', encoding='utf-8') as file:
    reviews = [json.loads(line) for line in file]

# Calculate the size of each chunk
chunk_size = len(reviews) // 25
if len(reviews) % 25 != 0:
    chunk_size += 1

# Split and save the chunks
for i in range(25):
    start_index = i * chunk_size
    end_index = start_index + chunk_size
    chunk = reviews[start_index:end_index]

    # Save the chunk to a new file
    output_file = os.path.join(output_folder, f"reviews_part_{i + 1}.json")
    with open(output_file, 'w', encoding='utf-8') as out_file:
        for review in chunk:
            out_file.write(json.dumps(review) + '\n')

print("Splitting completed. Files are saved in:", output_folder)
