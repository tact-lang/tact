struct L4 {
    p: Int?;
}
struct L3 {
    q: L4;
}
struct L2 {
    r: L3?;
}
struct L1 {
    s: L2;
}

contract DeepOptionalChain {
    chain: L1;

    init() {
        self.chain = L1{
            s: L2{
                r: null
            }
        };
    }
}