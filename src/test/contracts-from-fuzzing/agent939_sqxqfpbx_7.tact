struct Optionals {
    s: String?;
    b: Bool?;
    i: Int?;
    a: Address?;
    c: Cell?;
    sl: Slice?;
    bu: Builder?;
}

contract TestContract {
    opt: Optionals;

    init() {
        self.opt = Optionals{
            s: null, b: null, i: null, a: null, c: null, sl: null, bu: null
        };
    }
}