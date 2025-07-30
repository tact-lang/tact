struct Opts {
    aa: Int? = null;
    bb: String? = null;
    cc: Bool? = null;
}

contract DefaultsOpt {
    data: Opts;

    init() {
        self.data = Opts{};
    }
}