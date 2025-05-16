struct DeepNestedOpt {
    a: Int? = null;
    b: Nested? = null;
}

struct Nested {
    c: Int = 42;
    d: String = "hi";
}

contract DeepOptDefaults {
    rec: DeepNestedOpt;
    init() {
        self.rec = DeepNestedOpt{};
    }
}