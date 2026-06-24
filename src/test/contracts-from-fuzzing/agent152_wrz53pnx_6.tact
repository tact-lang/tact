struct InnerA {
    x: Int;
}

struct InnerB {
    y: Bool;
}

struct Outer {
    a: InnerA;
    b: InnerB;
}

contract MultiNested {
    data: Outer;

    init() {
        self.data = Outer{ a: InnerA{ x: 7 }, b: InnerB{ y:true } };
    }
}