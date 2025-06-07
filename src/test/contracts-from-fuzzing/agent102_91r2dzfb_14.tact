contract GetterReturn {
    v: Int;

    init() {
        self.v = 123;
    }

    get fun getV(): Int {
        if (self.v > 100) {
            return self.v;
        } else {
            return 0;
        }
    }
}
