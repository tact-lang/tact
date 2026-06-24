struct Wrapper {
    val: Int?;
}

contract DefaultNullOpt {
    opt: Wrapper;

    init() {
        self.opt = Wrapper{ val: null };
    }
}