struct Deep {
    x1: Int;
    x2: Int;
    x3: Int;
}

struct Wrapper {
    d1: Deep;
    d2: Deep;
}

contract TestContract {
    nestedDeep: Wrapper;

    init() {
        self.nestedDeep = Wrapper{
            d1: Deep{ x1: 1, x2: 2, x3: 3 },
            d2: Deep{ x1: 4, x2: 5, x3: 6 }
        };
    }

    receive() {
        self.nestedDeep = Wrapper{
            d1: Deep{ x1: 11, x2: 12, x3: 13 },
            d2: Deep{ x1: 14, x2: 15, x3: 16 }
        };
    }
}