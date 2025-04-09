struct Deep3 {
    foo: Int?;
    bar: Int as uint8;
}

struct Deep2 {
    inner: Deep3?;
}

struct Deep1 {
    nested: Deep2;
}

contract DeepComboPersist {
    data: Deep1;

    init() {
        self.data = Deep1{
            nested: Deep2{
                inner: null,
            },
        };
    }
}