struct BasicStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
}

contract VariedTypes {
    s: BasicStruct;

    init() {
        self.s = BasicStruct{
            a: 1,
            b: true,
            c: "hello",
            d: myAddress()
        };
    }
}
