contract MessyOptions {
    a: Int?; b: Int = 1; c: Bool?; d: Bool = false;
    s: String?; t: String = "text";

    init() {
        self.a = null;
        self.c = true;
        self.s = null;
    }

    receive() {
        let _ = self.b + (self.a != null ? self.a!! : 0);
    }
}