struct Str { s: String }
struct BoolWrap { b: Bool }
struct AddrWrap { a: Address }

struct Combo {
    str: Str;
    bool: BoolWrap;
    addr: AddrWrap;
}

contract MixedStructTest {
    val: Combo;

    init() {
        self.val = Combo{
            str: Str{s:"a"},
            bool:BoolWrap{b:true},
            addr:AddrWrap{a:myAddress()},
        };
    }
}
