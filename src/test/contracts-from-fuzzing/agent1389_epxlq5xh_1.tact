struct InnerStruct {
    a: Int;
    b: Bool?;
}

contract TestContract {
    s: InnerStruct;

    init() {
        self.s = InnerStruct{ a: 5, b: true };
    }
}