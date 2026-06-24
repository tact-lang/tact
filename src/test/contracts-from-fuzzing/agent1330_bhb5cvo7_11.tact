struct InnerA {
    foo: Int;
}

struct InnerB {
    bar: String;
}

struct Combo {
    partA: InnerA;
    partB: InnerB;
}

contract ComboContract {
    data: Combo;

    init() {
        self.data = Combo{
            partA: InnerA{ foo: 8 },
            partB: InnerB{ bar: "x" }
        };
    }
}