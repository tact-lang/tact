struct InnerMost {
    x: Int? = null;
    y: Bool? = null;
}

struct Mid {
    inner: InnerMost? = null;
}

struct Outer {
    mid: Mid? = null;
}

contract DeepOptDefaults {
    val: Outer = Outer{};
    
    init() {
        self.val = Outer{};
    }
}
