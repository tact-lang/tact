// Test optional string deeply nested
struct DeepOpt {
    inner: Deeper?;
}

struct Deeper {
    maybeText: String?;
}

contract OptionalStringDeep {
    root: DeepOpt;

    init() {
        self.root = DeepOpt{
            inner: Deeper{
                maybeText: null
            }
        };
    }
}