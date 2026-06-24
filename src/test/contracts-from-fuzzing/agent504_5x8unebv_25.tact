contract OptionalDefaultNull {
    myopt: Int? = null;

    init() {
        self.myopt = null;
    }

    receive() {
        let m = self.myopt;
    }
}