struct Optionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract TestContract {
    opt: Optionals;

    init() {
        self.opt = Optionals{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }

    receive() {
        self.opt = self.opt;
    }
}
