struct PrimitivesPacked {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
}

contract PackedPrim {
    d: PrimitivesPacked;
    init() {
        self.d = PrimitivesPacked{
            i: 1,
            b: true,
            s: "hi",
            a: myAddress(),
        };
    }
}