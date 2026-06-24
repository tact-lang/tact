struct A {
    val: Int;
}

struct B {
    val: Bool;
}

struct C {
    val: String;
}

contract TestContract {
    a: A;
    b: B;
    c: C;

    init() {
        self.a = A{ val: 1 };
        self.b = B{ val: true };
        self.c = C{ val: "hello" };
    }

    receive() {
        dump(self.a.val);
    }
}