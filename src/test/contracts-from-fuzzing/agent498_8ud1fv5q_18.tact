struct OptionalAndDefaults {
    a: Int = 5;
    b: Int?;
    c: String = "def";
    d: Bool?;
}

contract OptionalDefaultsUse {
    x: OptionalAndDefaults = OptionalAndDefaults{b:null,d:true};
}