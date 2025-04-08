struct SerializedNested {
    a: Int as uint4;
    b: Bool;
}

struct Holder {
    nested: SerializedNested;
    number: Int as uint32;
}

contract SerialNestedTest {
    s: Holder;

    init() {
        self.s = Holder{
            nested: SerializedNested{ a:3, b:true },
            number: 999,
        };
    }
}
