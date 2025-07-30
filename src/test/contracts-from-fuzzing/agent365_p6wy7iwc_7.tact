struct OptionalNest {
    inner: Int?;
}

contract OptNested {
    data: OptionalNest;
    init() {
        self.data = OptionalNest{inner: null};
    }
}