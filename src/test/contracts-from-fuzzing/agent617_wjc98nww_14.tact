struct OverlapA {
    val: Int;
}

struct OverlapB {
    val: Int;
}

struct Container {
    a: OverlapA;
    b: OverlapB;
}

contract SameFieldNames {
    c: Container;
    init() {
        self.c = Container{
            a: OverlapA{ val: 1 },
            b: OverlapB{ val: 2 }
        };
    }
}
