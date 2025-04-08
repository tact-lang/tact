contract OptPrimitive {
    num: Int?;

    init() {
        self.num = null;
    }

    receive() {
        let _ = self.num;
    }
}