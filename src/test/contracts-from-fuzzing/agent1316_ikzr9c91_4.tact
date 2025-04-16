struct WithDefaults {
    x: Int = 17;
    y: Bool = false;
    z: String = "abc";
    opt: Int?;
}

contract DefaultsContract {
    dat: WithDefaults;

    init() {
        self.dat = WithDefaults{
            z: "skip",
            x: 99,
            y: true,
            opt: null,
        };
    }
}