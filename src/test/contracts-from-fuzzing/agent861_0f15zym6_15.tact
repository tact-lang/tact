contract DefaultAndInit {
    x: Int = 0;
    y: Bool;

    init() {
        self.x = 5;
        self.y = true;
    }

    receive() {
        let _ = self.x;
        let _ = self.y;
    }
}