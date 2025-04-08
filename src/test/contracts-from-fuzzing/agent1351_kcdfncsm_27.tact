struct SomeStruct {
    a: Int;
    b: Int;
}

contract DuplicateFields {
    s: SomeStruct;
    s2: SomeStruct;

    init() {
        self.s = SomeStruct{ a:1, b:2 };
        self.s2 = SomeStruct{ a:3, b:4 };
    }
}