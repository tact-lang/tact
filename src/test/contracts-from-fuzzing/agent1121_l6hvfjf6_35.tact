// Contract with optional struct containing primitive optionals
struct OptStruct {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract OptionalStructFieldComplex {
    data: OptStruct?;

    init() {
        self.data = null;
    }
}