struct ManyOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract TestContract {
    s: ManyOptionals;

    init() {
        self.s = ManyOptionals{
            a: null, b: null, c: null, d: null, e: null, f: null
        };
    }
}