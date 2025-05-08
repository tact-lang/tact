struct ManyOpts {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Address?;
    e: Slice?;
    f: String?;
}

contract TestContract {
    m: ManyOpts?;

    init() {
        self.m = null;
    }
}