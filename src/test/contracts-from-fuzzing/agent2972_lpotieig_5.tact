struct Opts8 {
    f0: Int?;
    f1: Int?;
    f2: Int?;
    f3: Int?;
    f4: Int?;
    f5: Int?;
    f6: Int?;
    f7: Int?;
}

contract OptManyNulls {
    val: Opts8;

    init() {
        self.val = Opts8{
            f0: null,
            f1: null,
            f2: null,
            f3: 33,
            f4: null,
            f5: 55,
            f6: null,
            f7: 77,
        };
    }
}
