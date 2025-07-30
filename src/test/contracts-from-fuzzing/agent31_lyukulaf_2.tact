struct Deep {
    inner: StructLevel;
}

struct StructLevel {
    a: Bool;
    b: InnerInner;
}

struct InnerInner {
    c: Int?;
    d: Bool;
}

contract DeepNestTest {
    data: Deep;

    init() {
        self.data = Deep {
            inner: StructLevel{
                a: true,
                b: InnerInner{
                    c: null,
                    d: false,
                },
            },
        };
    }
}
