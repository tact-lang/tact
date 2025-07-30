struct A { a: Int; }
struct B { b: Int; }
struct AB {
    first: A;
    second: B;
}

contract NestedInsideNested {
    ab: AB;

    init() {
        self.ab = AB{ first: A{ a: 1 }, second: B{ b: 2 } };
    }
}