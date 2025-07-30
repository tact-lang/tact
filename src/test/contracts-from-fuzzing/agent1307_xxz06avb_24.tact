struct WeirdCombo {
    aa: Int?;
    bb: String = "";
    cc: Bool?;
    dd: String?;
}

contract WeirdContract {
    w: WeirdCombo = WeirdCombo{ aa: null, bb: "", cc: null, dd: null };

    init() {
        self.w = WeirdCombo{ aa: 1, bb: "nonempty", cc: true, dd: "x" };
    }
}