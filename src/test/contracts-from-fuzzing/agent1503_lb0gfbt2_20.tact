struct OptionStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract StructOptions {
    val: OptionStruct;

    init() {
        self.val = OptionStruct { a: null, b: null, c: null };
    }

    receive() {}
}