// Contract with optional primitive fields with inline defaults
contract DefaultsOptionalFields {
    a: Int?;
    b: Bool = true;
    c: String?;
    d: Int = 0;

    init() {
        self.a = null;
        self.c = null;
    }
}
