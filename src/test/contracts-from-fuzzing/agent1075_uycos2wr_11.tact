struct Inner {
    num: Int;
    flag: Bool;
    text: String;
    opt: Int?;
}

struct Mid {
    inner: Inner;
    other: Int;
}

contract StructInStructComplex {
    data: Mid;
    init() {
        self.data = Mid{
            inner: Inner{ num: 1, flag: true, text: "hello", opt: null },
            other: 2
        };
    }
}