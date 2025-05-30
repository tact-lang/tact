struct Deep {
    d: Int;
}

struct Middle {
    m: Deep;
}

struct Outer {
    o: Middle;
}

contract DeepNestedTest {
    f: Outer;

    init() {
        self.f = Outer{ o: Middle{ m: Deep{ d: 77 } } };
    }
}