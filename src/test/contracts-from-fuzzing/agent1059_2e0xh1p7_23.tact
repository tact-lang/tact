struct DeepOptional {
    lvl1: Int?;
    lvl2: String?;
}

struct OuterOpt {
    inner: DeepOptional?;
}

contract TestContract {
    s: OuterOpt;

    init() {
        self.s = OuterOpt{inner: null};
    }
}