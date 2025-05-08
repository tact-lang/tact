struct LongOptionalChain {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Cell?;
    opt5: Slice?;
    opt6: Address?;
    opt7: Builder?;
}

contract LongOptionalChainTest {
    data: LongOptionalChain;

    init() {
        self.data = LongOptionalChain{
            opt1: null,
            opt2: null,
            opt3: null,
            opt4: null,
            opt5: null,
            opt6: null,
            opt7: null
        };
    }
}