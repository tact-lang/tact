contract Defaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "default";
    d: Int?;
    e: String?;

    init() {
        self.d = null;
        self.e = null;
    }
}