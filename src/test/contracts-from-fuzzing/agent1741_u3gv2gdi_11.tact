struct ManyFields {
    f0: Int as uint4;
    f1: Int as uint4;
    f2: Int as uint4;
    f3: Int as uint4;
    f4: Int as uint4;
    f5: Int as uint4;
    f6: Int as uint4;
    f7: Int as uint4;
    f8: Int as uint4;
    f9: Int as uint4;
    f10: Int as uint4;
    f11: Int as uint4;
    f12: Int as uint4;
    f13: Int as uint4;
    f14: Int as uint4;
    f15: Int as uint4;
    f16: Int as uint4;
    f17: Int as uint4;
    f18: Int as uint4;
    f19: Int as uint4;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f0: 0, f1: 1, f2: 2, f3: 3, f4: 4, f5: 5, f6: 6, f7: 7, f8: 8, f9: 9,
            f10: 10, f11: 11, f12: 12, f13: 13, f14: 14, f15: 15, f16: 0, f17: 1, f18: 2, f19:3
        };
    }
}