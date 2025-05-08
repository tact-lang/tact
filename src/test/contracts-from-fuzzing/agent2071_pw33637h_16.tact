struct Deep {
    a: Int;
}

struct Wrapper {
    b: Deep;
}

contract ManyWrappers {
    w1: Wrapper;
    w2: Wrapper;
    w3: Wrapper;
    w4: Wrapper;

    init() {
        self.w1 = Wrapper{ b: Deep { a: 1 } };
        self.w2 = Wrapper{ b: Deep { a: 2 } };
        self.w3 = Wrapper{ b: Deep { a: 3 } };
        self.w4 = Wrapper{ b: Deep { a: 4 } };
    }
}