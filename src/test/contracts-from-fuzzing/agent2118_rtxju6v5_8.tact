struct Mid {
    v: Int;
    next: Leaf;
}

struct Leaf {
    data: Int;
}

contract OrderingTest {
    f: Mid;

    init() {
        self.f = Mid{
            v: 5,
            next: Leaf{ data: 42 }
        };
    }
}