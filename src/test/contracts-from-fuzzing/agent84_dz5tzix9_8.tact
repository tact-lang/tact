struct Nested {
    a: Int;
    b: Int?;
}

struct Outer {
    nested: Nested;
    extra: Bool;
}

contract Test7 {
    o: Outer;

    init() {
        self.o = Outer{
            nested: Nested{ a: 5, b: null },
            extra: true
        };
    }

    receive() {}

    get fun getOuter(): Outer {
        return self.o;
    }
}
