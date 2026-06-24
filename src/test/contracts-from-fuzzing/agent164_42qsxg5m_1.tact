struct DeepNested {
    inner: Middle?;
}

struct Middle {
    foo: Leaf?;
}

struct Leaf {
    val: Int;
}

contract Test {
    data: DeepNested;

    init() {
        self.data = DeepNested{ inner: Middle{ foo: Leaf{ val: 42 } } };
    }
}