struct BigOption {
    i: Int?;
    b: Bool?;
    s: String?;
    cl: Cell?;
    sl: Slice?;
    a: Address?;
}

contract OptionStorage {
    opt: BigOption?;
    init() {
        self.opt = null;
    }
}