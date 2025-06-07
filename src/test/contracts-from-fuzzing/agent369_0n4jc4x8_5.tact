struct DefaultsOnly {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
}

contract DefaultsOnlyTest {
    data: DefaultsOnly;

    init() {
        self.data = DefaultsOnly{};
    }
}