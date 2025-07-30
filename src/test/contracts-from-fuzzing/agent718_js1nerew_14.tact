struct TupleLike {
    first: Int;
    second: Int;
    third: Int;
}

contract TestContract {
    t1: TupleLike;
    t2: TupleLike;
    t3: TupleLike;

    init() {
        self.t1 = TupleLike{ first: 1, second: 2, third: 3 };
        self.t2 = TupleLike{ first: 4, second: 5, third: 6 };
        self.t3 = TupleLike{ first: 7, second: 8, third: 9 };
    }
}