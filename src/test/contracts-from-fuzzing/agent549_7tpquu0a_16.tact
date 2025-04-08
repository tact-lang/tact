struct StructWithDefaults {
    x: Int = 5;
    y: Bool = true;
    z: String = "hello";
}

contract DefaultInit {
    val: StructWithDefaults;

    init() {
        self.val = StructWithDefaults{};
    }
}