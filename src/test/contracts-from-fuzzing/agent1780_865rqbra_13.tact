struct InnerRemain {
    val: Int as uint8;
    rest: Slice as remaining;
}

struct OuterContainRemain {
    inner: InnerRemain;
    flag: Bool;
}

contract DeepRemainingTest {
    storage: OuterContainRemain;

    init() {
        self.storage = OuterContainRemain{
            inner: InnerRemain{
                val: 120,
                rest: emptyCell().asSlice()
            },
            flag: true
        };
    }
}