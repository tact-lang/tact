struct OptionTestStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionStorageTest {
    s: OptionTestStruct;

    init() {
        self.s = OptionTestStruct{ a: null, b: true, c: null };
    }
}