// Test persistent contract variable with optional struct with optional fields
struct DeepOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestOpt {
    persist: DeepOpt?;

    init() {
        self.persist = null;
    }
}