struct X { a: Int }

contract InitOrder {
    s: X = X{a: 5};
    i: Int = 3;
    b: Bool = true;
    s2: X = X{a: 7};

    init() {
        self.s = X{a: 10};
        self.i = 11;
        self.b = false;
        self.s2 = X{a: 17};
    }
}