# Get the path of the directory used for local TeX files
TEXMFHOMEPATH=$(kpsewhich -var-value TEXMFHOME)/tex/latex
# Check if this directory actually exists
if [ ! -d "$TEXMFHOMEPATH" ]; then
  # Create it if not
  echo "$TEXMFHOMEPATH does not exist."
  echo "Creating a directory for local TeX files: $TEXMFHOMEPATH"
  mkdir -p "$TEXMFHOMEPATH"
fi
# Check if directory for AutoCV already exists
if [ ! -d "$TEXMFHOMEPATH/autocv" ]; then
  # Create it if not
  echo "Creating a directory for AutoCV: $TEXMFHOMEPATH/autocv"
  mkdir "$TEXMFHOMEPATH/autocv"
fi
# Copy files in the dorectory
cp ./autocv.cls "$TEXMFHOMEPATH/autocv/autocv.cls"
cp -r ./templates "$TEXMFHOMEPATH/autocv/"
echo "AutoCV was added to local TeX files"
