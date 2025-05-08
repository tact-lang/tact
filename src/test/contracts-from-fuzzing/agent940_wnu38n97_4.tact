struct OptionalExample {
    num: Int?;
    flag: Bool?;
}

contract TestContract {
    data: OptionalExample;

    init() {
        self.data = OptionalExample{ num: null, flag: true };
    }
}