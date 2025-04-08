struct BigNested {
    s1: Nested1;
    s2: Nested2;
    s3: Nested3;
}

struct Nested1 {
    a: Int;
    b: Int?;
}

struct Nested2 {
    c: String;
    d: Bool;
}

struct Nested3 {
    e: String;
    f: Bool;
}

contract MultiNested {
    data: BigNested;

    init() {
        self.data = BigNested{
            s1: Nested1{ a: 10, b: null },
            s2: Nested2{ c: "x", d: true },
            s3: Nested3{ e: "y", f: false }
        };
    }
}