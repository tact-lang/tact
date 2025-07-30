struct BigNested {
    a: Int;
    b: Int?;
    c: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Int?;
}

contract BiggerNesting {
    big: BigNested;

    init() {
        self.big = BigNested{
            a: 10,
            b: null,
            c: InnerStruct{ x: 2, y: null }
        };
    }
}