struct Deep {
    inner1: Int;
    inner2: Int?;
}

struct Outer {
    d1: Deep;
    d2: Deep;
}

contract Test {
    val: Outer;

    init() {
        self.val = Outer{
            d1: Deep{ inner1: 1, inner2: null },
            d2: Deep{ inner1: 2, inner2: 3 },
        };
    }
}