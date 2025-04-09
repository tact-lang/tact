// Struct with multiple optional primitive fields
struct MixedOpt {
    a: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
    addr: Address?;
}

contract TestStructOpt {
    val: MixedOpt;

    init() {
        self.val = MixedOpt{ a: null, b: null, s: null, c: null, addr: null };
    }
}