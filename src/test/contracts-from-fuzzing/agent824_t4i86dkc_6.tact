struct OptionalNest {
    nest: Bool?;
}

contract TestContract {
    opt: OptionalNest?;

    init() {
        self.opt = OptionalNest{nest: false};
    }
}