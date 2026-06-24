struct Params {
    str: String;
    num: Int;
    flag: Bool;
}

contract Test5 {
    opt_params: Params?;

    init() {
        self.opt_params = null;
    }
}
