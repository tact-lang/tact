struct WideOpt {
    f1: Int?; f2: Int?; f3: Int?; f4: Int?; f5: Int?;
    f6: Bool?; f7: Bool?; f8: Bool?; f9: Bool?; f10: Bool?;
    f11: Address?; f12: Address?; f13: Address?; f14: Address?; f15: Address?;
}

contract TestWideOpt {
    data: WideOpt;

    init() {
        self.data = WideOpt {
            f1: null, f2: null, f3: null, f4: null, f5: null,
            f6: null, f7: null, f8: null, f9: null, f10: null,
            f11: null, f12: null, f13: null, f14: null, f15: null
        };
    }

    receive() {
        if (self.data.f15 != null) {
            let _ = self.data.f15!!;
        }
    }
}