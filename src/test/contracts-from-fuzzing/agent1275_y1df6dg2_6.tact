struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Int;
}

struct Combined {
    f1: Inner1;
    f2: Inner2;
}

contract ComboContract {
    combined: Combined;

    init() {
        self.combined = Combined{
            f1: Inner1{ x: 42 },
            f2: Inner2{ y: 100 },
        };
    }
}