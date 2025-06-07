struct Leaf {
    value: Int = 123;
}

struct Mid {
    leaf: Leaf?;
    flag: Bool = true;
}

struct Root {
    mid: Mid?;
    s: String?;
}

contract TestContract {
    complex: Root;

    init() {
        self.complex = Root{
            mid: Mid{ leaf: null },
            s: null
        };
    }

    receive() {
        self.complex;
    }
}