struct DeeplyNested {
    inner: Struct2;
}

struct Struct2 {
    sub: Struct3;
}

struct Struct3 {
    a: Int;
    maybeB: Bool?;
}

contract DeepNestTest {
    field: DeeplyNested;

    init() {
        self.field = DeeplyNested{
            inner: Struct2{
                sub: Struct3 {
                    a: 99,
                    maybeB: true,
                }
            }
        };
    }
}