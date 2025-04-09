struct MixedDefaults {
    x: Int = 42;
    y: Int?;
    z: String = "hello";
    w: String?;
    b: Bool = true;
    c: Bool?;
}

contract TestContract {
    data: MixedDefaults;

    init() {
        self.data = MixedDefaults{
            y: null,
            w: null,
            c: null
        };
    }
}