struct Compose {
    s: String;
    n: Int;
}

contract NestedOpt {
    inner: Compose?;
    outerStr: String;

    init() {
        self.inner = null;
        self.outerStr = "hi";
    }
}