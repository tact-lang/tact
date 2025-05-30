struct A {
    val: Int;
}

struct B {
    val: A;
}

struct C {
    val: B;
}

contract Deep3Layers {
    deep: C;

    init() {
        self.deep = C{ val: B{ val: A{ val: 123 } } };
    }
}