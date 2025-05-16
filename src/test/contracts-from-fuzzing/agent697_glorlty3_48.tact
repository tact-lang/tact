struct A {
    b: Int;
}

struct B {
    c: Int;
    a: A;
}

contract StructOrdering {
    val: B;

    init() {
        self.val = B{ c: 7, a: A{ b: 3 } };
    }
}