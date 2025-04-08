struct OptNest {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    st: OptNest;

    init() {
        self.st = OptNest{
            a: null,
            b: null,
            c: null
        };
    }
}