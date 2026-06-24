struct DefaultsOpt {
    flag: Bool?;
    txt: String?;
}

contract TestContract {
    testfield: DefaultsOpt? = null;   // explicit nullable option default

    init() {
        self.testfield = null;
    }
}
