struct InnerA {
    a: Int;
}
struct InnerB {
    b: Int;
}
struct InnerC {
    c: Int;
}

struct Outer {
    a: InnerA;
    b: InnerB;
    c: InnerC;
}

contract MultipleStructs {
    val: Outer;

    init() {
        self.val = Outer{
            a: InnerA{a:1},
            b: InnerB{b:2},
            c: InnerC{c:3}
        };
    }
}
