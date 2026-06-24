struct DefaultsAll {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
}

contract DefaultsAllTest {
    d: DefaultsAll;

    init() {
        self.d = DefaultsAll{};
    }
}