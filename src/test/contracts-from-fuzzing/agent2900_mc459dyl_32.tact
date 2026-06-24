struct SerializedInner {
    a: Int as uint8;
    b: Bool;
}

struct Wrap {
    s: SerializedInner?;
    x: Int as int16;
}

contract SerialNested {
    data: Wrap;

    init() {
        self.data = Wrap{
            s: null,
            x: 7,
        };
    }
}
