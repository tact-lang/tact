contract TestContract {
    flag: Bool;
    numb: Int;

    init() {
        self.flag = true;
        self.numb = 123;
    }

    receive() {
        self.flag = !self.flag;
        self.numb = self.numb + 1;
    }
}