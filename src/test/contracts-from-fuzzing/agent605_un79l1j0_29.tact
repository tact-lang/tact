struct S { a: Int }

contract UseSameStructTwice {
    first: S;
    second: S;

    init() {
        self.first = S{ a: 1 };
        self.second = S{ a: 2 };
    }
}