struct NegativeNumbers {
    a: Int as int32;
    b: Int as int64;
    c: Int;
}

contract NegativeTest {
    val: NegativeNumbers;

    init() {
        self.val = NegativeNumbers{a: -1, b: -99999, c: -123456789};
    }
}