struct InnerStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    nested: InnerStruct;

    init() {
        self.nested = InnerStruct{ a: 10, b: false, c: "hi" };
    }
}
