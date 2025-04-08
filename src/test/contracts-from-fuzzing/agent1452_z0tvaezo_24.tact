struct NegativeInt {
    n: Int as int16;
}

contract SerializeNeg {
    val: NegativeInt;

    init() {
        self.val = NegativeInt{n: -32123};
    }
}