struct Alpha {
    num: Int;
}

struct Beta {
    flag: Bool;
}

struct Gamma {
    text: String;
}

struct Aggregate {
    a: Alpha;
    b: Beta;
    c: Gamma;
    d: Int;
    e: String;
    f: Bool?;
    g: Cell;
    h: Slice;
    i: Builder;
    j: Address;
}

contract AggStorage {
    data: Aggregate;

    init() {
        self.data = Aggregate{
            a: Alpha{ num: 1 },
            b: Beta{ flag: true },
            c: Gamma{ text: "hello" },
            d: 2,
            e: "world",
            f: null,
            g: emptyCell(),
            h: emptyCell().asSlice(),
            i: beginCell(),
            j: myAddress()
        };
    }
}