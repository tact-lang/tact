struct TinyNested {
    inner: InnerStruct;
}

struct InnerStruct {
    num: Int;
}

contract TinyNestTest {
    foo: TinyNested;
    init() {
        self.foo = TinyNested{
            inner: InnerStruct{ num: 1 },
        };
    }
}