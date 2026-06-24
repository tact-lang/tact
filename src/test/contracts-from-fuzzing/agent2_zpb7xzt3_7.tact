struct Info {
    id: Int;
    label: String?;
}

struct BigOne {
    a: Int;
    b: Bool;
    c: Address?;
    d: Cell;
    e: Slice?;
    f: String;
    g: Bool?;
    h: Info;
    i: Info?;
    j: String;
    k: Int?;
}

contract TestContract {
    storage: BigOne;
    init() {
        self.storage = BigOne{
            a: 3,
            b: true,
            c: null,
            d: emptyCell(),
            e: null,
            f: "alpha",
            g: false,
            h: Info{
                id: 100,
                label: null
            },
            i: Info{
                id: 200,
                label: "beta"
            },
            j: "zeta",
            k: null
        };
    }
}