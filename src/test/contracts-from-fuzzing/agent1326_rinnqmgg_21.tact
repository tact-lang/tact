contract OptBool {
    flag: Bool?;

    init() {
        self.flag = null;
    }

    receive() {
        let _ = self.flag;
    }
}