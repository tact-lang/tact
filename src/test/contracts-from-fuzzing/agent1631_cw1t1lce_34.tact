struct B {
    val: Int = 1;
}

struct A {
    optB: B? = B{ val: 42 };
}

contract NestedOptValDefault {
    a: A;

    init() {
        self.a = A{};
    }
}