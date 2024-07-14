primitive Int;

struct S {
    a: Int;
    b: Int;
}

trait BaseTrait {}

contract TestContract {
    s: S;

    init() {
        self.s = S {a: 0, b: 0};
    }

    get fun test(): Int {
        if (self.s != null) {
            return self.s.a;
        } else {
            return 0;
        }
    }
}