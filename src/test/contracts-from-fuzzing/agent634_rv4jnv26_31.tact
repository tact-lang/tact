// test optional non-defaulted serialization hints
struct SN {
    a: Int? as uint4;
    b: Bool?;
}

contract OptSerNoDefault {
    val: SN;
    
    init() {
        self.val = SN{a: null, b: null};
    }
}