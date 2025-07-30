struct NestedInner {
    a: Int as uint8;
    b: Bool;
}

struct DeepNested {
    inner: NestedInner;
    flag: Bool;
}

contract DeepNestTest {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: NestedInner{
                a: 5,
                b: true,
            },
            flag: false,
        };
    }
}