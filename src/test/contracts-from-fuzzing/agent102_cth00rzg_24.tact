struct MixedDefaults {
    x: Int = 42;
    y: Bool;
    z: String = "default";
    opt: Int?;
}

contract MixedDefaultsTest {
    field: MixedDefaults;

    init() {
        self.field = MixedDefaults{ y:false, opt:null };
    }
}