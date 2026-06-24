struct AB {
    a: Int;
    b: Int?;
}

struct CD {
    c: AB;
    d: Int;
}

contract OptionalInside {
    inner: CD;

    init() {
        self.inner = CD{
            c: AB{ a: 1, b: null },
            d: 2
        };
    }
}