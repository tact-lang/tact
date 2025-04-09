struct OptionalOnOptional {
    inner: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
}

contract TestContract {
    x: OptionalOnOptional;

    init() {
        self.x = OptionalOnOptional{ inner: null };
    }
}