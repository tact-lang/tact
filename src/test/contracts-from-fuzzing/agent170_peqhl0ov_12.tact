struct A {
    ref: B?;
}

struct B {
    num: Int;
}

contract TestContract {
    val: A = A{ ref: null };

    init() {
        self.val = A{ ref: B{ num: 42 } };
    }

    receive() {
        let _ = self.val.ref;
    }
}