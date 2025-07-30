struct WideOpt {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
    h: Int?;
}

contract WideOptStore {
    x: WideOpt;

    init() {
        self.x = WideOpt{
            a: 1,
            b: null,
            c: 3,
            d: null,
            e: 5,
            f: null,
            g: 7,
            h: null,
        };
    }
}