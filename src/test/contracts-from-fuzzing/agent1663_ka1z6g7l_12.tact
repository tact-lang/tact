struct Defaults {
    x: Int = 10;
    y: Bool = true;
    z: String = "z";
    w: Int?;
}

contract WithDefaults {
    data: Defaults;

    init() {
        self.data = Defaults{
            w: null
        };
    }
}