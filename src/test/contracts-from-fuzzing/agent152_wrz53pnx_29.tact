struct DefaultsMix {
    a: Int = 1;
    b: Bool = false;
    c: Int? = null;
    d: Bool? = null;
    e: String = "hi";
    f: Slice? = null;
    g: Cell? = null;
    h: Address? = null;
}

contract DefaultsMixTest {
    data: DefaultsMix;

    init() {
        self.data = DefaultsMix{};
    }
}
