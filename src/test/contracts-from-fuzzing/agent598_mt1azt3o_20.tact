struct Inner {
    txt: String;
    cellVal: Cell;
    active: Bool?;
}

struct Mid {
    status: Bool;
    note: String?;
    inner: Inner?;
    number: Int as uint32;
}

struct Outer {
    label: String;
    midLayer: Mid;
    extra: Int?;
}

contract NestedComplex {
    data: Outer;

    init() {
        self.data = Outer{
            label: "root",
            midLayer: Mid{
                status: true,
                note: null,
                inner: Inner{
                    txt: "inside",
                    cellVal: emptyCell(),
                    active: null
                },
                number: 555
            },
            extra: null
        };
    }
}