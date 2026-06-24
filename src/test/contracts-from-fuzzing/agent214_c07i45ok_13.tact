struct SingleOptional {
    maybeInt: Int?;
}

contract TestContract {
    opt: SingleOptional;

    init() {
        self.opt = SingleOptional{
            maybeInt: null,
        };
    }
}
