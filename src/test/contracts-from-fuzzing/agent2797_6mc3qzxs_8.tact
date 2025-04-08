struct Defaulted {
    foo: Int = 10;
    bar: Bool = false;
    baz: String = "dft";
}

contract DefaultsStructTest {
    val: Defaulted;

    init() {
        self.val = Defaulted{};
    }
}