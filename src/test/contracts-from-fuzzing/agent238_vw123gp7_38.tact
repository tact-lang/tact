struct SerializeNested {
    a: Int as uint4;
    nested: InnerSerialize;
}

struct InnerSerialize {
    x: Int as int16;
    y: Int as uint8;
}

contract SerNestedContract {
    data: SerializeNested;

    init() {
        self.data = SerializeNested{
            a: 7,
            nested: InnerSerialize{x:123,y:250}
        };
    }
}