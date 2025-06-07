struct InnerOptional {
    val: Int? = null;
}

struct OuterOptional {
    inner: InnerOptional? = null;
}

contract DeepNullDefaults {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{};
    }
}