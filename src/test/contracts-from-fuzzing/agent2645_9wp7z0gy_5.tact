struct InnerA {
    a: Int;
}

struct InnerB {
    b: Bool;
}

struct Outer {
    choice: Int;
    aData: InnerA?;
    bData: InnerB?;
}

contract SumTypeLike {
    data: Outer;

    init() {
        self.data = Outer{
            choice: 0,
            aData: InnerA{a: 42},
            bData: null,
        };
    }
}
