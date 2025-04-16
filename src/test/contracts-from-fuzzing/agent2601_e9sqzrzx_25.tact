struct OptionalsDeep {
    a: Int?;
    b: Int?;
    c: OptionalsDeep2?;
}

struct OptionalsDeep2 {
    x: Bool?;
    y: String?;
}

contract RecursiveOptions {
    val: OptionalsDeep;
    init() {
        self.val = OptionalsDeep{ a:null, b:null, c: OptionalsDeep2{ x:null, y:null } };
    }
}