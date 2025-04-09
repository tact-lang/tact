struct SDefaultOpt {
    val1: Int = 5;
    val2: String = "hi";
    opt1: Bool?;
}

contract DefaultsAndOptional {
    d: SDefaultOpt;
    init() {
        self.d = SDefaultOpt{ val1: 10, val2: "bye" };
    }
}
