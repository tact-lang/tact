struct Deeper {
    level3: String;
}

struct Inner {
    level2: Int;
    deeper: Deeper;
}

struct DeepNested {
    level1: Bool;
    inner: Inner;
}

contract DeepNestTest {
    item: DeepNested;

    init() {
        self.item = DeepNested{
            level1: true,
            inner: Inner{
                level2: 123,
                deeper: Deeper{
                    level3: "deep"
                }
            }
        };
    }
}