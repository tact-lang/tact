struct OptionalNest {
    ox: Int?;
    oy: Bool?;
}

contract Optionals {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{ ox: null, oy: true };
    }
}