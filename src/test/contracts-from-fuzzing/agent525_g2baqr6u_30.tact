// struct with optional fields with default values
struct OptDef {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

contract Test {
    f: OptDef;

    init() {
        self.f = OptDef{};
    }
}