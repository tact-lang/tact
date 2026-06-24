struct Diverse {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Address;
    j: Address?;
}

contract DiverseStructTest {
    val: Diverse;

    init() {
        self.val = Diverse{
            a: 1,
            b: null,
            c: true,
            d: false,
            e: "hello",
            f: null,
            g: emptyCell(),
            h: null,
            i: myAddress(),
            j: null
        };
    }
}