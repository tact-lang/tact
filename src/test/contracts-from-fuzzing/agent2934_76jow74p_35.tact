struct A {
    i: Int;
}

struct B {
    o: A?;
}

struct C {
    o: B?;
}

contract OptOptChain {
    s: C;

    init() {
        self.s = C{ o: null };
    }
}