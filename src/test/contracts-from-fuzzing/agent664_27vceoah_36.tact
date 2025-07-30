struct N2 {
    x: Int?;
}

struct N1 {
    n2: N2?;
}

contract OptionalWrap {
    field: N1;

    init() {
        self.field = N1 { n2: null };
    }
}
