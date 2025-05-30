struct OptDefault {
    flag: Bool? = true;
    count: Int? = 42;
}

contract OptDefaultContract {
    stuff: OptDefault;

    init() {
        self.stuff = OptDefault{};
    }
}