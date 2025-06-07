struct ZeroDefaults {
    x: Int = 0;
    y: Bool = false;
    s: String = "";
}

contract DefaultsInStruct {
    rec: ZeroDefaults;

    init() {
        self.rec = ZeroDefaults{
            x: 10,
            y: true,
            s: "nonempty"
        };
    }
}