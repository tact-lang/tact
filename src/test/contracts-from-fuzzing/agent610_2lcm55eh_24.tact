// Struct with multiple optional fields with defaults
struct ManyOptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract ManyOptDefs {
    curr: ManyOptDefaults;

    init() {
        self.curr = ManyOptDefaults{};
    }
}