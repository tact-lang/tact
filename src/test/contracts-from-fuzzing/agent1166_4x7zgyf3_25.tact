// Deep test of nested options inside struct fields
struct Inner {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct Outer {
    d: Inner?;
    e: Inner?;
}

contract NestedOptionalStructs {
    s: Outer;

    init() {
        self.s = Outer{
            d: null,
            e: null
        };
    }
}
