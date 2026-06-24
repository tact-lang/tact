struct N1 {
    a: Int;
}

struct N2 {
    n: N1?;
}

struct N3 {
    m: N2?;
}

contract DeepOptional {
    nested: N3;

    init() {
        self.nested = N3{ m: null };
    }
}