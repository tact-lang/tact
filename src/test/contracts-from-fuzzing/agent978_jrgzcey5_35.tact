// contract optionals of nested structs with various field types inside
struct Inner {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

struct Mid {
    inner: Inner?;
    flag: Bool;
}

struct Outer {
    mid: Mid?;
    num: Int;
}

contract NestedOptionalsMix {
    o: Outer?;

    init() {
        self.o = null;
    }
}