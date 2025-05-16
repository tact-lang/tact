struct Leaf1 { x: Int; }
struct Leaf2 { y: Bool; }

struct Mid {
    a: Leaf1;
    b: Leaf2;
}

struct Top {
    inner: Mid;
}

contract NestedFanoutTest {
    data: Top;

    init() {
        self.data = Top{
            inner: Mid{
                a: Leaf1{ x: 101 },
                b: Leaf2{ y: true },
            },
        };
    }
}