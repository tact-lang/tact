struct Inner1 {
    x: Int?;
}

struct Inner2 {
    y: Bool?;
}

struct Combined {
    i1: Inner1;
    i2: Inner2;
}

contract TestCombinedInner {
    data: Combined;

    init() {
        self.data = Combined{
            i1: Inner1{ x: null },
            i2: Inner2{ y: null }
        };
    }
}
