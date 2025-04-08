contract OptInitUninit {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        // Intentionally leaving d unassigned
    }
}