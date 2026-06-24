struct SimpleStruct {
    a: Int;
    b: Int;
}

contract DuplicateTest {
    s: SimpleStruct;
    s2: SimpleStruct;

    init() {
        self.s = SimpleStruct{ a:1, b:2 };
        self.s2 = SimpleStruct{ a:3, b:4 };
    }
}