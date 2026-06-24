// Optional struct fields with default values null or otherwise
struct OptionDef {
    a: Int? = null;
    b: String? = null;
    c: Bool? = true;
}

contract TestContract {
    f: OptionDef;
    init() {
        self.f = OptionDef{};
    }
}