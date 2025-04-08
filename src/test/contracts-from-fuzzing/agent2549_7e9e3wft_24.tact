struct Before {
    a: Int;
}

struct After {
    b: Int;
}

contract DiffOrder {
    f1: After;
    f2: Before;

    init() {
        self.f1 = After{b: 2};
        self.f2 = Before{a: 1};
    }
}