struct A {
    i: Int;
}

struct B {
    optA: A?;
}

contract OptionalNestedStruct {
    val: B;

    init() {
        self.val = B{ optA: null };
    }
}
