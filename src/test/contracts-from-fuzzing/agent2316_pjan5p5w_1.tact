struct InnerStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    nestedStruct: InnerStruct;

    init() {
        self.nestedStruct = InnerStruct{
            a: 42,
            b: true,
            c: "test"
        };
    }
}