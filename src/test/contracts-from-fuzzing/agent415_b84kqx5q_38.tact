struct S {
    a: Int;
}

contract NestedArraysMock {
    x: S;

    init() {
        self.x = S{a:10};
    }
}