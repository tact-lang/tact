struct LargeOptDefault {
    x: Int? = null;
    b: Bool? = true;
    s: String? = "default";
}

contract LargeOptDefaultTest {
    val: LargeOptDefault;

    init() {
        self.val = LargeOptDefault{};
    }
}