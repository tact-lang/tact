struct Inner {
    a: Int;
    b: Bool;
}

struct Mid {
    inn: Inner;
}

struct Outer {
    mid: Mid;
}

contract TestContract {
    outer: Outer = Outer{mid: Mid{inn: Inner{a: 1, b: false}}};

    init() {
        self.outer = Outer{mid: Mid{inn: Inner{a: 42, b: true}}};
    }

    receive() {
        dump(self.outer.mid.inn.a);
    }
}