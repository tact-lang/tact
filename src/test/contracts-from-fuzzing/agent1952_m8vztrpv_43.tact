struct Leaf {
    x: Int? = 42;
    y: Bool? = null;
}

struct Middle {
    leaf: Leaf? = null;
    flag: Bool = true;
}

struct Top {
    mid: Middle? = null;
    i: Int = 7;
}

contract TestContract {
    t: Top;

    init() {
        self.t = Top{};
    }
}
