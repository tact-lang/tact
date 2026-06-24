struct WithDefaults {
    a: Int = 1;
    b: Bool = true;
    s: String = "default";
}

contract DefaultsInStruct {
    dat: WithDefaults;

    init() {
        self.dat = WithDefaults{};
    }

    receive() {
        let _ = self.dat.a;
    }
}