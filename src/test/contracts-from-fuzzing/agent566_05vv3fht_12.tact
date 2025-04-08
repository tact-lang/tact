struct Crazy {
    i: Int;
    o: Int?;
    s: SubCrazy;
    m: Bool;
    p: Cell;
}

struct SubCrazy {
    x: Inner;
    y: Inner?;
}

struct Inner {
    flag: Bool;
    val: Int;
    text: String?;
}

contract NestingMadness {
    field: Crazy;

    init() {
        self.field = Crazy{
            i: 1,
            o: null,
            s: SubCrazy{
                x: Inner{ flag: true, val: 10, text: null },
                y: null
            },
            m: false,
            p: emptyCell()
        };
    }
}
