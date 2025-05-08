contract TestContract {
    flag: Bool;

    init() {
        self.flag = true;
    }

    receive() {
        let x = self.flag;
    }
}
