contract TestCodeCurrentFixed {
    init() {}

    get fun test(): Int {
        let c1: Cell = codeOf TestCodeCurrentFixed;
        let c2: Cell = myCode();
        if (c1 == c2) {
            return 1;
        } else {
            return 0;
        }
    }

    receive() {
        let _ = self.test();
    }
}
