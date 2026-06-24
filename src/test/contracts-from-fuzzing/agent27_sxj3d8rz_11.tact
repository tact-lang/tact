contract GetterTest {
    v: Int = 0;

    get fun inc(): Int {
        self.v = self.v + 1;
        return self.v;
    }

    receive() {
        dump(self.inc());
        dump(self.inc());
    }
}
