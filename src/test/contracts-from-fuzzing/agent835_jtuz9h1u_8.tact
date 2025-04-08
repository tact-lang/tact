struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: String?;
    f: String?;
    g: Address?;
    h: Address?;
    i: Cell?;
    j: Cell?;
    k: Int?;
    l: Bool?;
    m: String?;
    n: Address?;
    o: Cell?;
}

contract OptionalsContract {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: 1, b: null, c: true, d: false, e: "hi", f: null,
            g: null, h: myAddress(), i: emptyCell(), j: null, k: 0,
            l: true, m: null, n: null, o: emptyCell(),
        };
    }
}