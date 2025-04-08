struct A {
    f1: Int?;
}

struct B {
    f2: A?;
}

struct C {
    f3: B?;
}

contract TestContract {
    deepOpt: C;

    init() {
        self.deepOpt = C {
            f3: null
        };
    }

    receive() {
        let _ = self.deepOpt.f3;
    }
}