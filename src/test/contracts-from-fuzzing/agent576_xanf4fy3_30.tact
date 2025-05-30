struct In {
    a: Int?; // implicit null
}

struct Out {
    inner: In? = null;
}

contract DoubleOpt {
    nested: Out;

    init() {
        self.nested = Out{};
    }
}
