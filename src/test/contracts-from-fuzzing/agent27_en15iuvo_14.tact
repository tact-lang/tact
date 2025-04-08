struct Num {
    a: Int;
}

contract ArrayLike {
    n1: Num;
    n2: Num;
    n3: Num;

    init() {
        self.n1 = Num{a:1};
        self.n2 = Num{a:2};
        self.n3 = Num{a:3};
    }
}