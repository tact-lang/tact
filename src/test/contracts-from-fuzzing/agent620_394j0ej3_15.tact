contract TestContract {
    x: Int as uint8 = -1;

    init() {
        self.x = 0;
    }

    receive() {
        let _ = self.x;
    }
}