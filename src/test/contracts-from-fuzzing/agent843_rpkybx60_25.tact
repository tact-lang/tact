struct Inner1 {
    a: Int;
}

struct Inner2 {
    x: Inner1;
}

contract DeepOpt {
    s: Inner2?;

    init() {
        self.s = Inner2{ x: Inner1{ a: 55 } };
    }
}
