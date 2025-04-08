struct OptionalAndDefaults {
    x: Int? = null;
    y: String = "default";
    z: Bool?;
}

contract TestContract {
    f: OptionalAndDefaults;

    init() {
        self.f = OptionalAndDefaults{
            z: true
        };
    }
}
