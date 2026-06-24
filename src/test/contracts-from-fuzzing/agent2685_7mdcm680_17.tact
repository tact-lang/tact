struct Outer {
    a: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    b: Int;
    c: String?;
}

contract Nested {
    o: Outer = Outer {
        a: 5,
        inner: InnerStruct { b: 6, c: null }
    };
}
