struct Defaults {
    n: Int = 5;
    flag: Bool = true;
}

contract TestContract {
    optionalDefaults: Defaults?;

    init() {
        self.optionalDefaults = null;
    }

    receive() {
        self.optionalDefaults = Defaults{ n: 42, flag: false };
    }
}