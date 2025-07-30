struct S {
    x: Int;
}

contract TestContract {
    field1: S;
    field2: S;
    field3: S;

    init() {
        self.field1 = S{x: 1};
        self.field2 = S{x: 2};
        self.field3 = S{x: 3};
    }
}
