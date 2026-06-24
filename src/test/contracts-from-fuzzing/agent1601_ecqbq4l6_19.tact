struct InnerA {
    valA: Int;
}

struct InnerB {
    valB: Int;
}

struct Middle {
    a1: InnerA;
    a2: InnerB;
}

struct Outer {
    m: Middle;
    x: String;
}

contract ComboNested {
    val: Outer;

    init() {
        self.val = Outer{
            m: Middle{
                a1: InnerA{ valA: 1 },
                a2: InnerB{ valB: 2 }
            },
            x: "hello"
        };
    }
}