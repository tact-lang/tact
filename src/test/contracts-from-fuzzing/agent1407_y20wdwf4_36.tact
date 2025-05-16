struct Leaf {
    v: Int = 777;
}

struct Middle {
    leaf: Leaf?;
}

struct Top {
    mid: Middle;
}

contract TestContract {
    deep: Top;

    init() {
        self.deep = Top{ mid: Middle{ leaf: null } };
    }
}