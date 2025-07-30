struct OptNest {
    innerOpt: Int?;
    boolVal: Bool;
}

contract TestContract {
    st: OptNest?;
    init() {
        self.st = OptNest{
            innerOpt: null,
            boolVal: true
        };
    }
}