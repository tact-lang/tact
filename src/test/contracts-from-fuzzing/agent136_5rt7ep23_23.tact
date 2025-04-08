struct StructWithStr {
    s: String;
}

contract StorageStrTest {
    s: StructWithStr;

    init() {
        self.s = StructWithStr{
            s: "Test"
        };
    }
}