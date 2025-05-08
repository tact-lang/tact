struct StorageWithOptional {
    optNum: Int?;
    optText: String?;
}

contract OptionalStructField {
    stored: StorageWithOptional;

    init() {
        self.stored = StorageWithOptional{
            optNum: null,
            optText: null
        };
    }
}