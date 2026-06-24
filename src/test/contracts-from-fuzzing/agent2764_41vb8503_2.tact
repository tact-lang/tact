struct Deep {
    level1: Int;
    optLevel2: Int?;
    str: String;
    cellVal: Cell;
}

struct Middle {
    d1: Deep;
    d2: Deep;
    optD: Deep?;
}

struct Outer {
    m1: Middle;
    optM: Middle?;
}

contract ComplexNested {
    data: Outer;

    init() {
        self.data = Outer{
            m1: Middle{
                d1: Deep{ level1: 1, optLevel2: null, str: "s", cellVal: emptyCell() },
                d2: Deep{ level1: 2, optLevel2: 3, str: "t", cellVal: emptyCell() },
                optD: null,
            },
            optM: null
        };
    }
}