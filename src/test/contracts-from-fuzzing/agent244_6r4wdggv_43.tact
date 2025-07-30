struct DeepNestedOpt {
    inner: Level2?;
}

struct Level2 {
    value: Int? = null;
}

contract DeepLayeredOverrides {
    v: DeepNestedOpt;

    init() {
        self.v = DeepNestedOpt{
            inner: null
        };
    }
}