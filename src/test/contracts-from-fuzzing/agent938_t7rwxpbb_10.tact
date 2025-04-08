struct LongOptionals {
    a1: Int?;
    a2: Int?;
    a3: Int?;
    a4: Int?;
    a5: Int?;
    a6: Int?;
    a7: Int?;
    a8: Int?;
    a9: Int?;
    a10: Int?;
    a11: Int?;
    a12: Int?;
    a13: Int?;
    a14: Int?;
    a15: Int?;
    a16: Int?;
}

contract LongOptContract {
    data: LongOptionals;

    init() {
        self.data = LongOptionals{
            a1: null, a2: 2, a3: null, a4: 4,
            a5: null, a6: 6, a7: null, a8: 8,
            a9: null, a10: 10, a11: null, a12: 12,
            a13: null, a14: 14, a15: null, a16: 16,
        };
    }
}