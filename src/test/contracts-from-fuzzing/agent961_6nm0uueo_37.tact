struct TwoOpt {
    val1: Int?;
    val2: Int?;
}

contract TwoOptContract {
    data: TwoOpt;

    init() {
        self.data = TwoOpt { val1: null, val2: 123 };
    }
}