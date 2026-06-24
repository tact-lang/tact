struct Small { a: Int; }

contract OptNestedStruct {
    s: Small?;

    init() {
        self.s = Small{ a: 123 };
    }
}