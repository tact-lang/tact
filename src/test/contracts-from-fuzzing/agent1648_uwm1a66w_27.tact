struct DeepOpt {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
    e: Slice?;
}

contract NestedDeepOpt {
    d: DeepOpt?;

    init() {
        self.d = null;
    }
}