struct MixedDefaults {
    a: Int;
    b: Int = 2;
    c: Int;
    d: Int = 4;
}

contract MixedDefaultFields {
    val: MixedDefaults;

    init() {
        self.val = MixedDefaults {
            a:1,c:3
        };
    }
}