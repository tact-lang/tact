struct MultiDefaults {
    x: Int = 1;
    y: String = "default";
    z: Bool = true;
}

contract MultiDefaultsContract {
    val: MultiDefaults;

    init() {
        self.val = MultiDefaults{
            x: 42,
            y: "override",
            z: false
        };
    }
}