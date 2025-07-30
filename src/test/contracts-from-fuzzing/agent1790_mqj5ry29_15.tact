struct A {
    val: Int;
}
struct B {
    a: A;
}
struct C {
    b: B;
}

contract NullNested {
    val: C?;

    init() {
        self.val = null;
    }
}
