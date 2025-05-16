// Struct with both defaulted fields and optionals
struct Mixed {
    a: Int = 1;
    b: Bool = true;
    c: Int?;
    d: Bool?;
}

contract TestContract {
    storage: Mixed;

    init() {
        self.storage = Mixed{};
    }
}