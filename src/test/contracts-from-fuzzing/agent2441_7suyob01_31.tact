struct NestedOptionals1 {
    opt: Int?;
    next: NestedOptionals2?;
}

struct NestedOptionals2 {
    opt: Bool?;
    next: NestedOptionals3?;
}

struct NestedOptionals3 {
    opt: String?;
}

contract ChainOpt {
    chain: NestedOptionals1?;
    init() {
        self.chain = null;
    }
}