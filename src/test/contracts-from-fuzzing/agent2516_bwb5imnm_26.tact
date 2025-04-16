// edge-case: optional struct with default values inside
struct DefsOpt {
    a: Int = 5;
    b: Bool = true;
}

contract OptionalWithDefaults {
    inner: DefsOpt?;

    init() {
        self.inner = null;
    }
}