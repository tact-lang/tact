struct A {
    x: Int;
}
struct B {
    y: A;
}
struct C {
    z: B;
}

contract NestedChain {
    val: C;

    init() {
        self.val = C{z: B{y: A{x: 123}}};
    }

    receive() {}
}