struct MultiOption {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract TestContract {
    opt: MultiOption?;

    init() {
        self.opt = null;
    }
}