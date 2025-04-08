contract TestContract {
    opt: Int? = 5;
    receive() {
        self.opt = null;
    }
}