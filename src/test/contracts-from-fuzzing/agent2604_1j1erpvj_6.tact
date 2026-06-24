struct InnerMost {
    x: Int;
}

struct Inner {
    val: InnerMost;
}

struct Outer {
    wrap: Inner;
}

contract DeepChain {
    storage: Outer;

    init() {
        self.storage = Outer{
            wrap: Inner{
                val: InnerMost{ x: 42 }
            }
        };
    }
}