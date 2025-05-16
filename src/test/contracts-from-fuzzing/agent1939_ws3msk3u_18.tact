struct InnerMost {
    d: Int;
}

struct Middle {
    c: InnerMost;
}

struct Outer {
    b: Middle;
}

contract TestContract {
    a: Outer;
    init() {
        self.a = Outer{ b: Middle{ c: InnerMost{ d: 777 } } };
    }
}