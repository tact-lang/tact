// Contract with optional deeply nested struct defaulted to null

struct DeepNestedOpt {
    inner: InnerMost?;
}

struct InnerMost {
    val: Int;
    name: String;
}

contract OptDeepNull {
    x: DeepNestedOpt?;
    init() {
        self.x = null;
    }
}
