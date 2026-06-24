struct OpAndDefaults {
    a: Int?;
    b: String = "default";
    c: Int = 123;
}

contract OpDefaults {
    val: OpAndDefaults = OpAndDefaults{
        a: null
    };

    init() {}
}