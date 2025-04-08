struct InnerMost {
    z: Int?;
}

struct Inner {
    y: InnerMost?;
}

struct Outer {
    x: Inner?;
}

contract DeepNull {
    f: Outer?;

    init() {
        self.f = null;
    }
}