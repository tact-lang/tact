contract TestContract {
    flag: Bool?;

    init() {}

    get fun flagVal(): Bool? {
        return self.flag;
    }
}