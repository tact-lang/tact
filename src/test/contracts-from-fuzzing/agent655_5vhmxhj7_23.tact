// optional fields, some with default null, some without
contract OptDefaults {
    a: Int?;
    b: Int? = null;
    c: String?;
    d: String? = null;

    init() {
        self.a = null;
        self.c = "hi";
    }
}