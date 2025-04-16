struct DefaultMix {
    a: Int = 10;
    b: String = "a";
    c: Bool?;
}

contract MixedDefaults {
    f: DefaultMix = DefaultMix{ c: null };
}