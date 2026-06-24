// Struct with many optionals with defaults specified

struct OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract OptDefContract {
    val: OptionalDefaults;

    init() {
        self.val = OptionalDefaults{};
    }
}