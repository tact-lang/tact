struct NestedDefault {
    x: Int = 5;
    y: Bool = true;
    z: String = "ok";
}

contract NestedDefaultTest {
    data: NestedDefault;

    init() {
        self.data = NestedDefault{};
    }
}