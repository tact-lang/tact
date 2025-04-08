struct LargeOptionalStruct {
    x1: Int?; x2: Int?; x3: Int?; x4: Int?; x5: Int?;
    x6: Int?; x7: Int?; x8: Int?; x9: Int?; x10: Int?;
    x11: Int?; x12: Int?; x13: Int?; x14: Int?; x15: Int?;
    x16: Int?; x17: Int?; x18: Int?; x19: Int?; x20: Int?;
}

contract LotsOfOptionals {
    data: LargeOptionalStruct;

    init() {
        self.data = LargeOptionalStruct{
            x1: null, x2: null, x3: null, x4: null, x5: null,
            x6: 6, x7: null, x8: 8, x9: null, x10: 10,
            x11: null, x12: 12, x13: null, x14: 14, x15: null,
            x16: 16, x17: null, x18: 18, x19: null, x20: 20,
        };
    }
}
