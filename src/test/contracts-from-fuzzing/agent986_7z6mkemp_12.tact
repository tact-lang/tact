struct BoolNested {
    flag: Bool;
    maybe: Bool?;
}

contract BoolCombo {
    data: BoolNested;

    init() {
        self.data = BoolNested{flag:true, maybe:null};
    }
}
