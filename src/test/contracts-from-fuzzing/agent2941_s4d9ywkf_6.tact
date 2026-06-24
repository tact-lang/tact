struct OptionalNest {
    inner: Int?;
}

contract OptionalNestContract {
    st: OptionalNest?;

    init() {
        self.st = null;
    }
}