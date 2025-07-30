struct SubDeep {
    flag: Bool;
}

struct Sub {
    sd: SubDeep;
    number: Int;
}

contract StructArrayImitation {
    item1: Sub;
    item2: Sub;
    init() {
        self.item1 = Sub{ sd: SubDeep{ flag: false }, number: 10 };
        self.item2 = Sub{ sd: SubDeep{ flag: true }, number: 20 };
    }
}