struct A {
    i: Int;
}

struct B {
    f1: A;
    f2: A;
}

contract NestedMultiSame {
    val: B;

    init() {
        self.val = B{ f1: A{ i:1 }, f2: A{ i:2 } };
    }
}