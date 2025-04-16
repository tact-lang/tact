contract TestContract {
    maybeFlag: Bool?;

    init() {
        self.maybeFlag = true;
        self.maybeFlag = null;
    }

    receive() {
        let f = self.maybeFlag;
    }
}