struct OptNested { z: Int; }

struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: OptNested?;
    f: Slice?;
    g: String?;
}

contract TestContract {
    options: ManyOpts;

    init() {
        self.options = ManyOpts{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null
        };
    }
}