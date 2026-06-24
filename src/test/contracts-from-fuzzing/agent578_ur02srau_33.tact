struct MixedOptDefaults {
    x: Int?;
    y: String = "h";
    z: Bool?;
}

contract MixedOptDefaultsContract {
    m: MixedOptDefaults;

    init() {
        self.m = MixedOptDefaults{
            x:10, y:"hello", z:true
        };
    }
}