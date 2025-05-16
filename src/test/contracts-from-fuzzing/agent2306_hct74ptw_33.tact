struct OptionalDeep {
    inner: OptionalDeeper?;
}

struct OptionalDeeper {
    x: Int;
}

contract OptDeepField {
    val: OptionalDeep?;

    init() {
        self.val = null;
    }
}
