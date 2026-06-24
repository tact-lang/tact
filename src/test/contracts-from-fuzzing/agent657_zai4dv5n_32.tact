struct Combination {
    i: Int;
    b: Bool;
    s: String;
    optI: Int?;
    optB: Bool?;
    optS: String?;
}

contract TestCombo {
    data: Combination;

    init() {
        self.data = Combination{
            i: 1,
            b: true,
            s: "x",
            optI: null,
            optB: null,
            optS: null
        };
    }
}