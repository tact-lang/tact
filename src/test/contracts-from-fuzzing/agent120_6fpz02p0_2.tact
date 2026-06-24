struct InnerStruct {
    a: Int;
    b: Bool;
    c: Address;
}

contract NestedContract {
    s: InnerStruct;

    init() {
        self.s = InnerStruct{
            a: 10,
            b: false,
            c: myAddress(),
        };
    }
}