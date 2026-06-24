struct WideFields {
    f0: Int;  f1: Int;  f2: Int;  f3: Int;  f4: Int;
    f5: Int;  f6: Int;  f7: Int;  f8: Int;  f9: Int;
    f10: Int; f11: Int; f12: Int; f13: Int; f14: Int;
}

contract TestContract {
    fields: WideFields = WideFields{
        f0: 0, f1: 1, f2: 2, f3: 3, f4: 4,
        f5: 5, f6: 6, f7: 7, f8: 8, f9: 9,
        f10: 10, f11: 11, f12: 12, f13: 13, f14:14
    };
}