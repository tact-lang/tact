contract TestAppliedDefaults {
    a: Int = 42;
    b: Bool?; // will be implicitly null
    c: String = "hi";
    d: Int?; // implicitly null

    init() {}
}