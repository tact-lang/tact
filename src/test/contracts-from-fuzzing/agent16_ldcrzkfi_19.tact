struct Tiny {
    x: Int;
}

struct TinyWrap {
    inner1: Tiny;
    inner2: Tiny;
    inner3: Tiny;
}

contract TinyStructs {
    data: TinyWrap;

    init() {
        self.data = TinyWrap{
            inner1: Tiny{ x: 1 },
            inner2: Tiny{ x: 2 },
            inner3: Tiny{ x: 3 }
        };
    }
}