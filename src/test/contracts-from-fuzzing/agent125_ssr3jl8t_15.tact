struct A {
    x: Int;
}

struct B {
    y: A;
}

struct C {
    z: B;
}

contract DeepOptionalStruct {
    val: C?;

    init() {
        self.val = null;
    }
}