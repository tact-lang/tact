struct A {
    x: Int?;
}

struct B {
    a: A?;
}

struct C {
    b: B?;
}

contract OptionChain {
    val: C;

    init() {
        self.val = C{ b: null };
    }
}