struct Base {
    id: Int;
}

contract ManyStructs {
    a: Base;
    b: Base;
    c: Base;
    d: Base;
    e: Base;

    init() {
        self.a = Base{ id: 1 };
        self.b = Base{ id: 2 };
        self.c = Base{ id: 3 };
        self.d = Base{ id: 4 };
        self.e = Base{ id: 5 };
    }
}