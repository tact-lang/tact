struct LotDefault {
    a: Int = 1;
    b: String = "two";
    c: Bool = true;
    d: Slice? = null;
    e: Int? = null;
}

contract DefaultsTest {
    data: LotDefault;

    init() {
        self.data = LotDefault{};
    }
}