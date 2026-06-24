struct SerializeNested {
    small: Int as uint4;
    nested: InnerSerialize;
}

struct InnerSerialize {
    si: Int as int8;
}

contract NestedSerializeContract {
    data: SerializeNested;

    init() {
        self.data = SerializeNested{
            small: 7,
            nested: InnerSerialize{ si: -8 }
        };
    }
}