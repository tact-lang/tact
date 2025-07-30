struct MixedDefaults {
    a: Int = 5;
    b: Bool?;
    c: String = "default";
}

contract WithDefaults {
    data: MixedDefaults;

    init() {
        self.data = MixedDefaults{
            b:true
        };
    }
}