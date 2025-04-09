struct A {
    i: Int;
}

struct B {
    o: A?;
}

contract OptionalStruct {
    val: B;
    init() {
        self.val = B{ o: null };
    }
}