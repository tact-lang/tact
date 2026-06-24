struct InnerMost {
    val: Int?;
}

struct Middle {
    inner: InnerMost?;
}

struct Outer {
    middle: Middle?;
}

contract DeepNested {
    item: Outer?;

    init() {
        self.item = null;
    }
}