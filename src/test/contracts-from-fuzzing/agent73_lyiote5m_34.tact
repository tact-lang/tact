struct Mid {
    m1: Int;
    m2: Int?;
}

struct Outer {
    o1: Mid;
    o2: Mid?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{ o1: Mid{ m1: 5, m2: null }, o2: null };
    }
}