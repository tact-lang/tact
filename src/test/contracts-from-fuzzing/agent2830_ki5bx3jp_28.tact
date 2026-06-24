contract JustDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int?; // implicit null default
    init() {} // no assignment should be needed
}