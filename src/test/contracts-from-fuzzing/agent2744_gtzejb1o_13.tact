struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Bool;
}

struct Combined {
    i1: Inner1;
    i2: Inner2;
}

contract MultipleNestedStructs {
    combined: Combined;

    init() {
        self.combined = Combined{
            i1: Inner1{ a: 5 },
            i2: Inner2{ b: true }
        };
    }
}
