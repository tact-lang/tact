struct SLevel3 {
    v: Int;
}

struct SLevel2 {
    inner: SLevel3;
}

struct SLevel1 {
    inner: SLevel2;
}

contract DeepChain {
    chain: SLevel1;

    init() {
        self.chain = SLevel1{
            inner: SLevel2{
                inner: SLevel3{
                    v: 555,
                },
            },
        };
    }
}
