struct A {
    val: Int;
}

struct B {
    a: A;
}

contract NestedRepeats {
    p1: B;
    p2: B;

    init() {
        self.p1 = B{a: A{val: 1}};
        self.p2 = B{a: A{val: 2}};
    }
}