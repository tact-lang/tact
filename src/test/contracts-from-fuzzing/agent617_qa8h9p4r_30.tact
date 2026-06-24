struct OuterDefaults {
    a: Int = 1;
    b: Int?;
}

contract DefNullCombo {
    data: OuterDefaults = OuterDefaults{ b: null };
    init() {
        self.data = OuterDefaults{ a:7, b:null };
    }
}