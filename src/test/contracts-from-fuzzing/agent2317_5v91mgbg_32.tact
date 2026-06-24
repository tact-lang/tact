struct A {
    val: Int;
}

struct B {
    inner: A;
}

contract FieldOrder {
    f1: Int = 1;
    f2: B;
    f3: String = "abc";

    init() {
        self.f2 = B{inner: A{val:5}};
    }
}