struct HoldsPrimitives {
    i: Int;
    s: String;
    b: Bool;
    a: Address;
}

contract WrapPrimitives {
    prims: HoldsPrimitives;

    init() {
        self.prims = HoldsPrimitives{
            i: 100,
            s: "hey",
            b: true,
            a: myAddress()
        };
    }
}