struct Sub {
    flag: Bool = false;
    val: Int? = null;
}

contract WeirdCombo {
    s: Sub = Sub{};

    init() {
        self.s = Sub{flag:true, val:null};
    }
}
