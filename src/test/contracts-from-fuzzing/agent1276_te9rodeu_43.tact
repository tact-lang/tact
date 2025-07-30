struct Inner {
    x: Int;  // required
}

struct Mid {
    inner: Inner?; // optional
}

contract NullWithRequiredInside {
    top: Mid?;

    init() {
        self.top = null;
    }
}