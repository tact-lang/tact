struct A {
    x: Int;
}

struct B {
    y: A?;
}

contract OptNestedStruct {
    val: B;

    init() {
        self.val = B{ y: null };
    }
}
