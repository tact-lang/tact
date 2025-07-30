// contract with a struct that has mixed default and non-default fields
struct MixedDefaults {
    y: Int = 7;
    z: Int;
    w: Int = 9;
}

contract MixedDefFields {
    m: MixedDefaults;

    init() {
        self.m = MixedDefaults{
            z: 13
        };
    }
}