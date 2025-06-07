struct Defaults {
    name: String = "Saturn";
    flag: Bool = false;
    count: Int = 42;
}

contract DefaultsTest {
    item: Defaults;

    init() {
        self.item = Defaults{};
    }
}