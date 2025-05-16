message OnlyOpt {
    maybe: Int?;
}

contract TestContract {
    m: OnlyOpt;

    init() {
        self.m = OnlyOpt{maybe: null};
    }
}