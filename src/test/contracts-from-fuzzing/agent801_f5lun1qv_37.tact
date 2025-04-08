struct Middle {
    a: Int;
    b: Int?;
}

struct Outer {
    left: Middle;
    right: Middle?;
}

contract OptionalBranches {
    root: Outer;

    init() {
        self.root = Outer{
            left: Middle{ a: 5, b: null },
            right: Middle{ a: 6, b: 7 }
        };
    }
}