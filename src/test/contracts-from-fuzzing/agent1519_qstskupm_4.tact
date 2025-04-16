struct Sub {
    v: Int = 123;
}

struct Combo {
    maybeNum: Int?; 
    maybeObj: Sub?;
}

contract TestCombo {
    myData: Combo = Combo{};

    init() {
        self.myData = Combo{
            maybeNum: 55,
            maybeObj: Sub{v: 99}
        };
    }
}