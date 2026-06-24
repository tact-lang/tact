struct Leaf1 { a: Int; }
struct Leaf2 { b: Bool; }
struct Leaf3 { c: Address; }

struct Middle {
    l1: Leaf1;
    l2: Leaf2;
    l3: Leaf3;
}

struct Top {
    m: Middle;
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{
            m: Middle{
                l1: Leaf1{ a: 42 },
                l2: Leaf2{ b: true },
                l3: Leaf3{ c: myAddress() },
            }
        };
    }
}