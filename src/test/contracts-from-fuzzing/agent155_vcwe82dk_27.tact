struct DeepOpt {
    val: Int = 42;
}

struct Wrapper {
    nested: DeepOpt?;
}

contract TestContract {
    w: Wrapper = Wrapper{ nested: null };

    init() {
        self.w = Wrapper{ nested: null };
    }
}