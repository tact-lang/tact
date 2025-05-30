struct Combo {
    val: Int;
    text: String;
    opt: Bool?;
}

contract ComboAsField {
    combo: Combo;
    init() {
        self.combo = Combo{val:1, text:"foo", opt:null};
    }
}