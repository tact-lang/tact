// Deep optional inside nested struct, with default nulls
struct S1 {
    a: Int?;
    b: Bool?;
}

struct S2 {
    inner: S1?;
    val: Int;
}

contract DeepNestedNulls {
    s2: S2;

    init() {
        self.s2 = S2{
            inner: null,
            val: 123
        };
    }
}
