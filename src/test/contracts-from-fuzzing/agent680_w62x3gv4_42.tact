contract BoolInitLogic {
    a: Bool;
    b: Bool;
    c: Bool;

    init() {
        self.a = true;
        self.b = false;
        self.c = self.a && !self.b;
    }

    receive() {
        let _ = self.c ? 1 : 0;
    }
}