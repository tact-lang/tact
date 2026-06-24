contract ChainedOptInit {
    val: Int?;

    init() {
        self.val = null;
    }

    receive() {
        let _ = self.val;
    }
}