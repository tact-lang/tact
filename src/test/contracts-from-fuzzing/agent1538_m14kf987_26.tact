contract TestContract {
    flag: Bool = true;
    optFlag: Bool? = null;

    init() {
        self.flag = false;
        self.optFlag = null;
    }
}