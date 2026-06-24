contract DefaultedFieldsInit {
    a: Int = 1;
    b: Bool = true;
    c: Int?; // no default

    init() {
        self.c = 7;
    }
}
