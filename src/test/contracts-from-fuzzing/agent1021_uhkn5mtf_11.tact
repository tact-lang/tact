// Nested optional structs combined with persistent storage
struct Inner {
    val: Int?;
    flag: Bool?;
}

struct Outer {
    inner: Inner?;
    note: String?;
}

contract OptionalNestedOptional {
    o: Outer = Outer{
        inner: null,
        note: null,
    };
}