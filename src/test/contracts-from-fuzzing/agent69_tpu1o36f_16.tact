struct Defaulted {
    x: Int = 7;
    y: Bool = true;
    s: String?; // defaults to null
}

contract OverrideDefaults {
    d: Defaulted;

    init() {
        self.d = Defaulted{
            x: 70,
            y: false,
            s: "not null"
        };
    }
}