struct OptionalNest {
    inner: Int?;
    flag: Bool;
}

contract Test {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{ inner: null, flag: false };
    }
}