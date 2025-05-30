struct StructWithString {
    s: String;
}

struct OuterWithInner {
    inner: StructWithString;
}

contract TestStringNested {
    data: OuterWithInner;

    init() {
        self.data = OuterWithInner{
            inner: StructWithString{
                s: "hello",
            },
        };
    }
}