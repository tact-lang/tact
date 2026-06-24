struct NestedDefault {
    a: Int = 5;
    b: Bool = true;
    c: String = "str";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract DefaultTest {
    s: NestedDefault;

    init() {
        self.s = NestedDefault{};
    }
}