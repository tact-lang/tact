struct Optionals {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract TestContract {
    state: Optionals;

    init() {
        self.state = Optionals{
            optInt: null,
            optBool: true,
            optStr: null,
        };
    }
}