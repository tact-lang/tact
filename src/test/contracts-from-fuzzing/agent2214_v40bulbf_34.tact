struct A {
    x: Int;
}
struct B {
    a: A?;
}
struct C {
    b: B?;
}
struct D {
    c: C?;
}

contract DeepOptChain {
    val: D;

    init() {
        self.val = D{ c: null };
    }
}