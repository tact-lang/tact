// Contract with nested optional struct with defaults
struct OptionalDefault {
    foo: Int? = null;
    bar: Bool? = null;
    message: String = "hi";
}

contract OptDef {
    val: OptionalDefault;

    init() {
        self.val = OptionalDefault{}; // rely on defaults
    }
}