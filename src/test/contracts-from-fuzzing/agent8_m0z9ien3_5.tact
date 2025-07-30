contract TestReturnGetter {
    v: Int;

    init() {
        self.v = 100;
    }

    // Getter with nested blocks and conditional return
    get fun getVal(flag: Bool): Int {
        if (flag) {
            {
                return self.v;
            }
        } else {
            return self.v + 1;
        }
    }
}
