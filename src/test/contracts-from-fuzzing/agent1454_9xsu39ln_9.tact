struct Combo {
    a: Int;
    b: Bool;
    c: String?;
    d: Address;
    e: Bool?;
}

contract ComboStore {
    combo: Combo;

    init() {
        self.combo = Combo{
            a:1,
            b:true,
            c:null,
            d: myAddress(),
            e: false
        };
    }
}