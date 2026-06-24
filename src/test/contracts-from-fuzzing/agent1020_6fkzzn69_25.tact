contract BoolOptions {
    a: Bool?;
    b: Bool = true;
    c: Bool;

    init() {
        self.c = false;
        self.a = null;
    }
}
