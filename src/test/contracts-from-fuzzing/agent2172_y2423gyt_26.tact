contract NoInitAllDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Int?;  // implicitly null
    e: Bool?; // implicitly null
    f: String?; // implicitly null
}