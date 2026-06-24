struct SBool { b: Bool; }
struct SInt { i: Int; }
struct SString { s: String; }

struct Combo {
    sb: SBool;
    si: SInt;
    ss: SString;
}

contract StructCombo {
    val: Combo;

    init() {
        self.val = Combo {
            sb: SBool{b:true},
            si: SInt{i:99},
            ss: SString{s:"x"}
        };
    }
}