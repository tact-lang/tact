// Optionals with defaults
struct DefaultOpt {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract TestContract {
    defOpt: DefaultOpt;

    init() {
        self.defOpt = DefaultOpt{};
    }
}