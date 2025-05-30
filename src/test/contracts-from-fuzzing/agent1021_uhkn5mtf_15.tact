// Test a struct with nullable nested struct with defaults
struct Inner {
    v: Int = 7;
    flag: Bool = false;
}

struct Outer {
    i: Inner?;
    s: String?;
}

contract NullableInnerDefault {
    o: Outer = Outer{
        i: null,
        s: null,
    };
}