// Contract with a large struct containing various primitives and optionals
struct BigMix {
    i: Int;
    bi: Bool?;
    addr: Address;
    sadd: Address?;
    s: String;
    ss: String?;
    c: Cell;
    sc: Cell?;
}

contract TestContract {
    s: BigMix;
    init() {
        self.s = BigMix{
            i:1, bi:null, addr:myAddress(), sadd:null,
            s:"abc", ss:null, c:emptyCell(), sc:null
        };
    }
}