contract BigNestStructs {
    s1: Inner1;

    init() {
        self.s1 = Inner1{ i2: Inner2{ i3: Inner3{ x: 42 } } };
    }
}

struct Inner1 { i2: Inner2; }
struct Inner2 { i3: Inner3; }
struct Inner3 { x: Int; }
