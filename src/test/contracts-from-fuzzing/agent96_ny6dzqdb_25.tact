struct Tiny {
    a: Int;
}

struct Middle {
    tin: Tiny;
}

struct Outer {
    mid: Middle;
}

contract Test {
    outer: Outer;

    init() {
        self.outer = Outer{
            mid: Middle{
                tin: Tiny{ a: 99 }
            }
        };
    }
}