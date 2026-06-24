struct BlazingDefaults {
    a: Int = -1;
    b: Bool = true;
    c: String = "default";
}

contract BlazeTest {
    val: BlazingDefaults;

    init() {
        self.val = BlazingDefaults{};
    }
}