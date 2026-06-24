struct A {
    x: Int?;
}

struct B {
    y: A?;
}

struct C {
    z: B?;
}

contract TestContract {
    deep: C;

    init() {
        self.deep = C{ z: B{ y: A{ x: 123 } } };
    }
}