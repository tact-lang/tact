struct Combo {
    flag: Bool?;
    always: Bool;
    optNum: Int?;
}

contract OptBoolTest {
    combo: Combo;
    init() {
        self.combo = Combo{ flag: null, always: true, optNum: null };
    }
}