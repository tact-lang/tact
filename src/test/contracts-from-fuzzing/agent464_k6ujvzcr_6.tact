struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
    f: Slice?;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Cell?;
    k: Address?;
    l: Slice?;
}

contract ManyOptionalsContract {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: null, b: null, c: null, d: null, e: null, f: null,
            g: null, h: null, i: null, j: null, k: null, l: null
        };
    }
}