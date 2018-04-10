RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

fileHeaders=("Filename:" "Author:" "Userid:" "Description:" "Date:" "Sources of help:")

functionHeaders=("Function Name:" "Function Prototype: " "Description:" 
                "Parameters:" "Side Effects:" "Error Conditions:" "Return Value:")

assemblyHeaders=("Registers used:" "example:")

for file in "$@"
do
  echo
  echo -e "${BLUE}Checking file: $file${NC}"
  echo -e "${GREEN}Lines over 80 charcters: ${NC}"
  echo -e "${RED}$(grep -n '^.\{81\}' $file)${NC}" 
  echo -e "${GREEN}File Header: ${NC}" 
  for header in "${fileHeaders[@]}"
  do
    found=$(head -n 15 $file | grep "$header")
    if [ "$found" == "" ]; then
      echo -e "${RED}Missing file header!${NC}"
      break
    fi
  done
  echo -e "${GREEN}TODOs in the file: ${NC}"
  echo -e "${RED}$(grep -n 'TODO' $file)${NC}" 


done

