struct OptOnly {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract PersistOptOnly {
    val: OptOnly;

    init() {
        self.val = OptOnly{ a: null, b: null, s: null };
    }
}