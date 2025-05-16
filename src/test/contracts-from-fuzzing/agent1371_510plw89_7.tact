struct DataBlob {
    s1: String?;
    s2: Slice?;
    s3: String?;
}

contract NullForest {
    data: DataBlob?;

    init() {
        self.data = null;
    }
}
