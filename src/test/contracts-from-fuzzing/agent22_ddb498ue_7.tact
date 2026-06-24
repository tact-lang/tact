struct OptionalNest {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
}

contract TestContract {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            opt1: null,
            opt2: true,
            opt3: null
        };
    }
}
