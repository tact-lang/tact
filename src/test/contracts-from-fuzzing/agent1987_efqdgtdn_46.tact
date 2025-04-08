struct Combo {
    a: Int;
    b: Int?;
    c: Sub;
}

struct Sub {
    d: Bool;
    e: String?;
}

contract ComboContract {
    val: Combo;
    init() {
        self.val = Combo{
            a: 42,
            b: null,
            c: Sub{d:true, e:"wut"}
        };
    }
}