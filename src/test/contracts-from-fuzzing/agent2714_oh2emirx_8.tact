struct Variant {
    i: Int;
    s: String;
    b: Bool;
    a: Address;
}

contract Test8 {
    data: Variant;

    init() {
        self.data = Variant{
            i: 12,
            s: "hello",
            b: true,
            a: myAddress()
        };
    }
}