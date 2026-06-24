struct LongFields {
    a: Int = 1; b: Int = 2; c: Int = 3; d: Int = 4;
    e: Int = 5; f: Int = 6; g: Int = 7; h: Int = 8;
    i: Int = 9; j: Int = 10; k: Int = 11; l: Int = 12;
    m: Int = 13; n: Int = 14; o: Int = 15; p: Int = 16;
    q: Int = 17; r: Int = 18; s: Int = 19; t: Int = 20;
}

contract ContractLongFields {
    val: LongFields;

    init() {
        self.val = LongFields{
            a: 11, b: 12, c: 13, d: 14,
            e: 15, f: 16, g: 17, h: 18,
            i: 19, j: 20, k: 21, l: 22,
            m: 23, n: 24, o: 25, p: 26,
            q: 27, r: 28, s: 29, t: 30,
        };
    }
}