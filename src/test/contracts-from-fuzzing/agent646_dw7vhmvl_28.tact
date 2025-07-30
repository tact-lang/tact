struct Defaulted {
    foo: Int = 1;
    bar: Bool = false;
    baz: String = "default";
}

contract StructDefaultTest {
    saved: Defaulted;

    init() {
        self.saved = Defaulted{};
    }
}