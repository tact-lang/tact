struct Inner {
    a: Int;
    b: String?;
}

struct Outer {
    c: Bool;
    d: Inner;
    e: Int?;
}

contract NestedStructOptionalTest {
    data: Outer;

    init() {
        self.data = Outer{
            c: true,
            d: Inner{
                a: 1,
                b: null,
            },
            e: null,
        };
    }
}