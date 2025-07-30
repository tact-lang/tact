struct S {
    a: Int;
    b: Int;
    c: Int;
}

contract NestedInsidePersistence {
    outer: S;

    init() {
        self.outer = S{a:1,b:2,c:3};
    }
}
