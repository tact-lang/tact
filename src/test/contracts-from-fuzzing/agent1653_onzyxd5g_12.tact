contract TestContract {
    opt: Int?;
    receive() {
        self.opt = 42;
    }
}