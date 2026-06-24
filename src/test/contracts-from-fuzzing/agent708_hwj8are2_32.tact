struct A {
    a: Int?;
}

struct B {
    b: A?;
}

struct C {
    c: B?;
}

contract OptChainLong {
    val: C;
    init() {
        self.val = C{ c: null };
    }
}