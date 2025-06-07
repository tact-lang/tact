struct VeryLongFlat {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Int;
    f8: Int;
    f9: Int;
    f10: Int;
    f11: Int;
    f12: Int;
    f13: Int;
    f14: Int;
    f15: Int;
    f16: Int;
    f17: Int;
    f18: Int;
    f19: Int;
    f20: Int;
}

contract TestVeryLongFlat {
    receive() {
        let instance: VeryLongFlat = VeryLongFlat {
            f1: 1, f2: 1, f3: 1, f4: 1, f5: 1,
            f6: 1, f7: 1, f8: 1, f9: 1, f10: 1,
            f11: 1, f12: 1, f13: 1, f14: 1, f15: 1,
            f16: 1, f17: 1, f18: 1, f19: 1, f20: 1
        };
        let sum = instance.f1 + instance.f2 + instance.f3 + instance.f4 + instance.f5 +
                  instance.f6 + instance.f7 + instance.f8 + instance.f9 + instance.f10 +
                  instance.f11 + instance.f12 + instance.f13 + instance.f14 + instance.f15 +
                  instance.f16 + instance.f17 + instance.f18 + instance.f19 + instance.f20;
        dump(sum);
    }
}
