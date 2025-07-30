struct InlineDefault {
    a: Int = 42;
    b: Bool = true;
    c: String = "default";
    d: Int?; // defaults to null implicitly
}

contract DefaultsTest {
    point: InlineDefault;

    init() {
        self.point = InlineDefault{};
    }
}