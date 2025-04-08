struct WeirdMix {
    must: Int;
    maybeNum: Int?;
    maybeBool: Bool?;
    optStr: String? = null;
    defStr: String = "foo";
    defInt: Int = 7;
    defBool: Bool = false;
}

contract MixDefaults {
    x: WeirdMix;

    init() {
        self.x = WeirdMix{
            must: 1,
            maybeNum: null,
            maybeBool: null
        };
    }
}