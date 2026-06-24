contract TestStringConst {
    const GREETING: String = "Hello, World!";

    receive() {
        let msg: String = self.GREETING;
    }
}
