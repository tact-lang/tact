contract FieldsDefaults {
    x: Int = 1;
    y: Int?;
    z: Bool = false;
    s: String = "";
    s2: String?;
    init() {}  // should be fine as defaults are set
}