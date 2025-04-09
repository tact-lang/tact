struct IntSerialization {
    small: Int as uint4;
    big: Int;
}

contract IntSerializeIssue {
    data: IntSerialization;

    init() {
        self.data = IntSerialization{
            small: 15,
            big: -1
        };
    }
}
