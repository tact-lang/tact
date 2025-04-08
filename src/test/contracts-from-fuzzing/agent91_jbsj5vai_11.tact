struct BigList {
    f1: Int; f2: Int; f3: Int; f4: Int; f5: Int;
    f6: Int; f7: Int; f8: Int; f9: Int; f10: Int;
    f11: Bool; f12: Bool; f13: Bool; f14: Bool; f15: Bool;
    f16: Bool; f17: Bool; f18: Bool; f19: Bool; f20: Bool;
}

contract BigListContract {
    data: BigList;

    init() {
        self.data = BigList{
            f1: 1, f2: 2, f3: 3, f4: 4, f5: 5,
            f6: 6, f7: 7, f8: 8, f9: 9, f10: 10,
            f11: true, f12: false, f13: true, f14: false, f15: true,
            f16: false, f17: true, f18: false, f19: true, f20: false
        };
    }
}
