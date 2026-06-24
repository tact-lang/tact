contract RequireInit {
    a: Int;
    b: Bool;

    init() {
        self.a = 5;
        self.b = true;
    }

    receive() {
        let _ = self.b;
    }
}