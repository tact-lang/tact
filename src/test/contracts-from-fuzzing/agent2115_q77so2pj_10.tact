// Optional of struct with optional fields
struct InnerOpt {
    a: Int?;
    b: Bool?;
}

contract DoubleOpt {
    s: InnerOpt? = null;
    init() {
        self.s = InnerOpt{};
    }
}