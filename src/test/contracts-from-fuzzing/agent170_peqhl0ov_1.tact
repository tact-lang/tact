contract TestContract {
    flag: Bool = true;
    value: Int = 42;

    init() {
        self.flag = false;
        self.value = 100;
    }

    receive() {
        // dummy usage
        let a = self.flag;
        let b = self.value;
    }
}