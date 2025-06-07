contract AugTest {
    flag: Bool = true;

    receive() {
        self.flag &&= false;
        dump(self.flag);
    }
}
