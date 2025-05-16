struct First {
    a: Int = 1;
    b: Bool = true;
}

struct Second {
    inner: First;
    str: String = "x";
}

contract ChainedStructDefaults {
    s: Second;

    init() {
        self.s = Second{ inner: First{} };
    }

    receive() {}
}