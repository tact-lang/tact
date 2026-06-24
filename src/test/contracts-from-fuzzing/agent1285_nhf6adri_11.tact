// Struct with many optionals
struct ManyOpts {
    a: Int?;
    b: Int?;
    c: String?;
    d: Bool?;
    e: Address?;
    f: Cell?;
    g: Slice?;
}

contract TestContract {
    opts: ManyOpts;
    init() {
        self.opts = ManyOpts{
            a: null, b: null, c: null, d: null,
            e: null, f: null, g: null
        };
    }
}