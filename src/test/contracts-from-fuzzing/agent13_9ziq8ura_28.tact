struct InnerMost {
    x: Int?;
}

struct Inner {
    nested: InnerMost?;
}

struct Outer {
    layer: Inner?;
}

contract DeepNullable {
    val: Outer?;

    init() {
        self.val = null;
    }
}