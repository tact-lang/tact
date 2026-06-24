contract Test {
    flag: Bool = false;

    receive() {
        self.flag = true;
    }
}
