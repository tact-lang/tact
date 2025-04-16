struct NestedDefaults {
    q: Int = 5;
    r: Bool = true;
    s: String = "x";
}

contract DefaultsInStruct {
    f: NestedDefaults = NestedDefaults{};
}