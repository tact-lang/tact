struct BigMix {
    int1: Int;
    int2: Int?;
    b1: Bool;
    b2: Bool?;
    s1: String;
    s2: String?;
    addr1: Address;
    addr2: Address?;
    c1: Cell;
    c2: Cell?;
    sl1: Slice;
    sl2: Slice?;
}

contract TestContract(val: BigMix) {
    receive() {
        let _ = self.val;
    }
}