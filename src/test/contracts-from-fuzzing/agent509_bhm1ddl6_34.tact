struct D4 {
    last: Int?;
}
struct D3 {
    next: D4?;
}
struct D2 {
    next: D3?;
}
struct D1 {
    next: D2?;
}

contract NullDeepChain {
    chain: D1?;

    init() {
        self.chain = D1{ next: null };
    }
}