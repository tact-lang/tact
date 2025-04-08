struct DeepNested {
    inner: Middle?;
}

struct Middle {
    detail: Leaf;
}

struct Leaf {
    flag: Bool;
}

contract DeepOptionalTest {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            inner: Middle{
                detail: Leaf{ flag: false }
            }
        };
    }
}