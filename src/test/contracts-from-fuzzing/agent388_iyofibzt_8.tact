// deeply nested nested nested struct
struct Bottom {
    v: Int;
}

struct Mid2 {
    b: Bottom;
}

struct Mid1 {
    m: Mid2;
}

struct Top {
    m: Mid1;
}

contract DeeplyNested {
    t: Top = Top{ m: Mid1{ m: Mid2{ b: Bottom{ v: 55 } } } };

    init() {
        self.t = Top{ m: Mid1{ m: Mid2{ b: Bottom{ v: 99 } } } };
    }
}