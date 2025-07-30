struct Defaults {
    s: String = "def";
    n: Int = 100;
    b: Bool = true;
}

contract DefaultsOverride {
    d: Defaults;

    init() {
        self.d = Defaults{
            s: "custom",
            n: 200,
            b: false
        };
    }
}