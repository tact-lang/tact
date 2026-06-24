struct HasDefaults {
    id: Int = 9;
    desc: String = "test";
    flag: Bool?;
}

contract DefaultStructField {
    f: HasDefaults = HasDefaults{};
}