struct MultiLayer {
    a: Int;
    b: Bool;
}

struct OuterLayer {
    inner: MultiLayer?;
    text: String;
}

contract OptionalNullableStruct {
    data: OuterLayer;

    init() {
        self.data = OuterLayer{
            inner: null,
            text: "hi"
        };
    }
}