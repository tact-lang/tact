struct OptionalInner {
    s: String?;
}

struct Outer {
    i: Int;
    inner: OptionalInner;
}

contract StructWithNestedOptionalString {
    val: Outer;
    init() {
        self.val = Outer{
            i: 10,
            inner: OptionalInner{ s: "hello" }
        };
    }
}