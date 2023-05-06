from datasets import load_dataset
import csv

dataset = 'sst2'
store_path = f'./data/{dataset}'
dataset = load_dataset(dataset)
dataset_size = [2000, 40, 1821]

for i, part in enumerate(['train', 'validation', 'test']):
    part_dataset = dataset[part]
    cnt = 0
    with open(f'{store_path}/{part}.tsv', 'w', newline='') as f:
        writer = csv.writer(f, delimiter='\t')
        writer.writerow(['sentence', 'label'])
        for item in part_dataset:
            writer.writerow([item['sentence'], item['label']])
            cnt += 1
            if cnt >= dataset_size[i]:
                break

print('done')
