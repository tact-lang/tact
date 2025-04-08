// Nested struct with optional nested struct fields
struct InnerA {
    foo: Bool?;
    bar: Int?;
}

struct OuterA {
    first: InnerA?;
    second: InnerA?;
}

contract OptInOpt {
    data: OuterA;

    init() {
        self.data = OuterA{
            first: null,
            second: InnerA{ foo: true, bar: null }
        };
    }
}