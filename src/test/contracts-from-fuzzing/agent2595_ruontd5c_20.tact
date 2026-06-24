// excessive nested levels with defaults and optional nullable wrappers
struct DeepInner {
    x: Int = 99;
    y: String = "deep";
}

struct MiddleLayer {
    deep: DeepInner?;
}

struct OuterLayer {
    middle: MiddleLayer?;
}

contract ExcessiveNestOptionalDefault {
    data: OuterLayer?;

    init() {
        self.data = null;
    }
}