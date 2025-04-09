struct A {
    x: Int;
}

struct B {
    p: A?;
}

struct C {
    p: B?;
}

struct D {
    p: C?;
}

contract MultiOptionals {
    storage: D;

    init() {
        self.storage = D{ p: null };
    }

    receive() {
        if (self.storage.p != null) {
            let _ = self.storage.p!!;
        }
    }
}