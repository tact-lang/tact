struct A {
    val: Int;
    next: B?;
}

struct B {
    val: Int;
    next: C?;
}

struct C {
    val: Int;
}

contract TestContract {
    chain: A;

    init() {
        self.chain = A { val: 1, next: B{ val: 2, next: C{ val: 3 } } };
    }
}