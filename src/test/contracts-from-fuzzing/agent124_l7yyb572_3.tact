contract Test {
    flag: Int = 0;

    receive() {
        self.flag = 1;
    }
}
