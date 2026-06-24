struct NullableStrings {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract NullableStorage {
    data: NullableStrings;

    init() {
        self.data = NullableStrings{ s1: null, s2: null, s3: null };
    }
}
