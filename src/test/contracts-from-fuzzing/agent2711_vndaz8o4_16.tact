struct MultiDefaults {
    x: Int = 1;
    y: String = "two";
    z: Bool = false;
}

contract InitOverrideSome {
    mf: MultiDefaults;

    init() {
        self.mf = MultiDefaults{
            y: "yy",
            z: true,
        };
    }
}