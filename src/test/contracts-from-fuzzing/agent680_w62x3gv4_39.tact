contract OptBoolDefaults {
    a: Bool? = null;
    b: Bool? = null;

    init() {
        self.a = true;
        self.b = false;
    }

    receive() {
        let _ = (self.a != null ? self.a!! : false) ||
                (self.b != null ? self.b!! : false);
    }
}