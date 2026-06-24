struct S {
    x: Int;
}

struct Wrapper1 {
    s: S?;
}

struct Wrapper2 {
    w1: Wrapper1?;
}

contract NestedOptional {
    data: Wrapper2;

    init() {
        self.data = Wrapper2 {
            w1: null
        };
    }
}