contract Test {
    flag: Bool = false;

    receive() {
        self.flag = true;
    }

    get fun isFlagSet(): Bool {
        return self.flag;
    }
}
