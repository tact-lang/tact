struct OptionalNest {
    f: Int?;
    s: String?;
    b: Bool?;
}

contract TestContract {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            f: null,
            s: null,
            b: true,
        };
    }
}