struct Leaf {
    val: Int;
}

struct Mid {
    leaf: Leaf?;
}

struct Outer {
    mid: Mid?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            mid: null
        };
    }
}