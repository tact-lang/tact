struct S {
    bigInt1: Int;
    bigInt2: Int;
    bigInt3: Int;
    bigInt4: Int;
    bigInt5: Int;
    small: Bool;
}

contract TestContract {
    field: S;

    init() {
        self.field = S{
            bigInt1: 1,
            bigInt2: 2,
            bigInt3: 3,
            bigInt4: 4,
            bigInt5: 5,
            small: false,
        };
    }
}