struct NestedStruct {
    a: Int;
    b: Bool;
    c: String?;
}

contract TestContract {
    ns: NestedStruct;

    init() {
        self.ns = NestedStruct{
            a: 1,
            b: true,
            c: "hello",
        };
    }
}