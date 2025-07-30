struct InnerNested {
    x: Int;
    y: Bool?;
    s: String;
}

struct OuterNested {
    a: Int;
    inner: InnerNested;
    b: Bool;
    maybeStr: String?;
}

contract NestedStructContract {
    data: OuterNested;
    
    init() {
        self.data = OuterNested{
            a: 10,
            inner: InnerNested{
                x: 5,
                y: null,
                s: "hello"
            },
            b: true,
            maybeStr: null
        };
    }
}
