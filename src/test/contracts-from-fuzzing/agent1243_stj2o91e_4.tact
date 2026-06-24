struct OptionalNest {
    innerOpt: Int?;
}

contract TestContract {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{ innerOpt: null };
    }

    receive() {
        if (self.data.innerOpt != null) {
            dump(self.data.innerOpt!!);
        }
    }
}