struct MixedOrder {
    a: Int;
    b: Bool?;
    c: String;
    d: Bool;
    e: Int?;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
}

contract TestContract {
    state: MixedOrder;

    init() {
        self.state = MixedOrder{
            a: 1,
            b: null,
            c: "hello",
            d: true,
            e: null,
            f: null,
            g: myAddress(),
            h: null,
            i: emptyCell(),
            j: null
        };
    }
}