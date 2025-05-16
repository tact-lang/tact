struct OptNest {
    n1: Int?;
    n2: Bool?;
    n3: String?;
}

contract OptionalFieldsContract {
    opt: OptNest;

    init() {
        self.opt = OptNest{
            n1: null,
            n2: true,
            n3: "test"
        };
    }
}