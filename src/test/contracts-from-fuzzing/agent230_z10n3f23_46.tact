struct TwoOpt {
    a: Int?;
    b: Int?;
}

contract StructTwoOpt {
    val: TwoOpt;

    init() {
        self.val = TwoOpt { a: null, b: null };
    }
}
