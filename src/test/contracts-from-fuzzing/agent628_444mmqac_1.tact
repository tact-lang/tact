struct NestedOpt {
    i: Int?;
    s: String?;
}

contract StorageTest {
    complexField: NestedOpt;

    init() {
        self.complexField = NestedOpt{ i: null, s: null };
    }
}