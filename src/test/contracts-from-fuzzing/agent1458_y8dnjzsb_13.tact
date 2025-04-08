struct Mixture {
    a: Int = 1;
    b: Bool = true;
    c: Address;
    d: Cell?;
    e: Slice?;
    f: String = "ok";
    g: Int?;
    h: Bool?;
}

contract Test {
    mixed: Mixture;

    init() {
        self.mixed = Mixture{
            c: myAddress(),
            d: null,
            e: null,
            g: null,
            h: null,
        };
    }
}