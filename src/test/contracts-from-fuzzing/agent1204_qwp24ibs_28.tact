// Optionals with default non-null values
struct DefaultsOpt {
    a: Int? = null;
    b: Bool? = true;
    c: String? = "hello";
}

contract DefaultsOptTest {
    d: DefaultsOpt;

    init() {
        self.d = DefaultsOpt{};
    }
}