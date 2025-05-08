struct A {
    x: Int;
    y: Int?;
}

struct B {
    a: A;
    z: Int?;
}

contract OptionalMixed {
    val: B?;

    init() {
        self.val = null;
    }
}