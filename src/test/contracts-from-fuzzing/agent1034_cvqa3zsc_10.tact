struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract ChainNestedOptional {
    deep: C?;

    init() {
        self.deep = null;
    }
}