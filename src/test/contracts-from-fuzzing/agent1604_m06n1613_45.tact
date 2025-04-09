struct A {
    val: Int;
}

struct B {
    nested: A?;
}

contract OptInStruct {
    st: B;
    init() {
        self.st = B { nested: null };
    }
    receive() {}
}