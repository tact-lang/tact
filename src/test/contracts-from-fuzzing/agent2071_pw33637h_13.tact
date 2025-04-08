struct AlmostEmpty {
    only: Int;
}

contract MultipleAlmostEmpty {
    f1: AlmostEmpty;
    f2: AlmostEmpty;
    f3: AlmostEmpty;
    f4: AlmostEmpty;
    f5: AlmostEmpty;

    init() {
        self.f1 = AlmostEmpty{ only: 1 };
        self.f2 = AlmostEmpty{ only: 2 };
        self.f3 = AlmostEmpty{ only: 3 };
        self.f4 = AlmostEmpty{ only: 4 };
        self.f5 = AlmostEmpty{ only: 5 };
    }
}