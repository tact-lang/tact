struct MixedDefaults {
    a: Int; // no default
    b: String = "test";
    c: Bool; // no default
}

contract MixedDefaultsContract {
    data: MixedDefaults;

    init() {
        self.data = MixedDefaults{
            a: 5,
            c: true
        };
    }

    receive() {
        let _ = self.data.b;
    }
}