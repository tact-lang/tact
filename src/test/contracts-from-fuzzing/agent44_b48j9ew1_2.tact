struct Deep {
    l1: Int;
    l2: Bool;
    l3: String;
    l4: Int?;
}

struct Outer {
    d: Deep;
    numb: Int;
}

contract Test {
    outer: Outer;

    init() {
        self.outer = Outer{
            d: Deep{ l1: 1, l2: true, l3: "x", l4: null },
            numb: 10
        };
    }

    receive() {
        let _ = self.outer.d.l3;
    }
}