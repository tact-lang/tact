struct Opts {
    aa: Int?;
    bb: Bool?;
    cc: String?;
}

contract TestContract {
    optsField: Opts;

    init() {
        self.optsField = Opts{
            aa: null,
            bb: true,
            cc: null
        };
    }
}