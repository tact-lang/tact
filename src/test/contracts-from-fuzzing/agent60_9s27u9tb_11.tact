struct BigOpt {
    val1: Int?;
    val2: Int?;
    val3: Bool?;
    val4: Bool?;
    val5: String?;
}

contract TestContract {
    bigOpt: BigOpt;

    init() {
        self.bigOpt = BigOpt{
            val1: 1,
            val2: null,
            val3: true,
            val4: null,
            val5: "opt"
        };
    }
}