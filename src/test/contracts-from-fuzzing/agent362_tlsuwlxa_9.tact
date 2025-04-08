struct Big {
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
}

contract TestContract {
    aggregate: Big;

    init() {
        self.aggregate = Big{
            f1: 1, f2: 2, f3: 3, f4: 4, f5: 5,
            f6: 6, f7: 7, f8: 8, f9: 9, f10: 10
        };
    }

    receive() {
        self.aggregate = Big{
            f1: 10, f2: 9, f3: 8, f4: 7, f5: 6,
            f6: 5, f7: 4, f8: 3, f9: 2, f10: 1
        };
    }
}