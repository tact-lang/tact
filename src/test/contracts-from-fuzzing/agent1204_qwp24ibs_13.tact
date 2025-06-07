// contract with optional struct that has many primitive optional fields
struct OptStruct {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
    sl: Slice?;
}

contract OptStructHolder {
    stuff: OptStruct?;

    init() {
        self.stuff = null;
    }
}