struct MixedDefaults {
    a: Int = 1;
    b: Int;
    c: Bool;
    d: Bool = true;
    e: String = "default";
    f: String;
}

contract TestContract {
    data: MixedDefaults;

    init() {
        self.data = MixedDefaults{
            b: 123,
            c: false,
            f: "custom",
        };
    }
}
