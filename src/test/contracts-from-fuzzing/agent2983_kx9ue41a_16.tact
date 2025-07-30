struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Int;
}

struct Outer {
    x: Inner1;
    y: Inner2;
}

contract TwoStructFields {
    combined: Outer;

    init() {
        self.combined = Outer{
            x: Inner1{ a: 1 },
            y: Inner2{ b: 2 }
        };
    }
}