struct InnerStrings {
    a: String;
    b: String;
}

contract StructOfStrings {
    s: InnerStrings;

    init() {
        self.s = InnerStrings{ a:"hello", b:"world" };
    }
}