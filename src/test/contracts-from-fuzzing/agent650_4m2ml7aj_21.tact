// Deep optional chain in a struct stored in contract field
struct DeepOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Slice?;
    e: Cell?;
    f: String?;
}

contract TestContract {
    deepOpt: DeepOpt?;

    init() {
        self.deepOpt = null;
    }
}
