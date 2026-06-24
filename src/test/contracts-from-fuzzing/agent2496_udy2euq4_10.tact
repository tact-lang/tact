struct MultiLayer {
    a: Int;
    b: Bool;
    c: String;
    inner1: Inner1;
}

struct Inner1 {
    d: Int?;
    inner2: Inner2;
}

struct Inner2 {
    e: Bool;
    f: String?;
    g: Int;
}

contract MultiLayerNested {
    store: MultiLayer;

    init() {
        self.store = MultiLayer{
            a: 1,
            b: true,
            c: "A",
            inner1: Inner1{
                d: null,
                inner2: Inner2{
                    e: false,
                    f: "hello",
                    g: 22,
                },
            },
        };
    }
}
