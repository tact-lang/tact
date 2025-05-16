contract ZeroInitExplicit {
    a: Int;
    b: Bool;
    s: String;

    init() {
        self.a = 0;
        self.b = false;
        self.s = "";
    }

    receive() {
        let _ = self.a;
    }
}