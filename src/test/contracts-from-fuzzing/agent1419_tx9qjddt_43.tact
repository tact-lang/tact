contract BoolSerialize {
    a: Bool = true;
    b: Bool? = false;
    c: Bool?;

    init() {
        self.c = null;
    }
}