struct DefaultsMix {
    i: Int = 5;
    s: String = "a";
    o: Int? = null;
    b: Bool = false;
}
contract DefaultsMixTest {
    f: DefaultsMix;
    init() {
        self.f = DefaultsMix{};
    }
}