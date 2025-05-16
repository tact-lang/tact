struct OptionInside {
    v: Int?;
    s: String?;
    b: Bool?;
}

struct Wrap {
    o: OptionInside;
}

contract Layered {
    w: Wrap;

    init() {
        self.w = Wrap{
            o: OptionInside{ v:null,s:null,b:null }
        };
    }
}