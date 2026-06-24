contract DefaultsAndOverrides {
    a: Int = 1;
    b: Bool = false;
    c: Address;
    d: String = "default";
    e: Int?;

    init() {
        self.c = myAddress();
        self.e = null;
    }
}