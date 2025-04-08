struct Tiny {
    a: Int;
}

contract TestContract {
    t1: Tiny = Tiny{a: 1};
    t2: Tiny = Tiny{a: 2};
    t3: Tiny = Tiny{a: 3};

    init() {
        self.t1 = Tiny{a: 10};
        self.t2 = Tiny{a: 20};
        self.t3 = Tiny{a: 30};
    }
}