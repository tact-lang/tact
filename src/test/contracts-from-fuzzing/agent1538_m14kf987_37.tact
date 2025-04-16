contract TestContract {
    flag: Bool = 1 + 1 == 2;

    init() {}

    get fun flagValue(): Bool {
        return self.flag;
    }
}