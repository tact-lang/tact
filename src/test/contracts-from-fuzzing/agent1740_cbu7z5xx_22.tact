struct A {
    x: Int as uint4;
}

struct B {
    a: A;
    y: Int as uint256;
}

contract SerializeMix {
    val: B;

    init() {
        self.val = B { a: A { x: 7 }, y: 999 };
    }
}