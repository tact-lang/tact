struct BigStruct {
    f1: Int;
    f2: Int?;
    f3: map<Int, Int>;
    f4: map<Address, Bool>;
    f5: Bool;
}

contract Test {
    s: BigStruct;

    init() {
        self.s = BigStruct {
            f1: 1,
            f2: null,
            f3: emptyMap(),
            f4: emptyMap(),
            f5: false
        };
    }
}