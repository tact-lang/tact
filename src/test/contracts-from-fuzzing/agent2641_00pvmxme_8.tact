struct InnerMost {
    val: Int;
}

struct Middle {
    im: InnerMost?;
}

struct Outer {
    m: Middle?;
}

contract DeepNulls {
    storage: Outer;

    init() {
        self.storage = Outer{
            m: null,
        };
    }
}