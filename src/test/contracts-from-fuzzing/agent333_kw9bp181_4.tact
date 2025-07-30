struct OptStr {
    n: Int?;
    s: String?;
}

contract TestContract {
    opt: OptStr;

    init() {
        self.opt = OptStr{ n: null, s: null };
    }
}