struct FlatOpt {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Cell?;
    f5: Slice?;
    f6: Address?;
}

contract OptTest {
    val: FlatOpt;

    init() {
        self.val = FlatOpt{
            f1: null,
            f2: null,
            f3: null,
            f4: null,
            f5: null,
            f6: null
        };
    }
}