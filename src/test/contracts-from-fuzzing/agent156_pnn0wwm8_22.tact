contract BoolDefaultIntNull {
    flag: Bool = true;
    number: Int? = null;

    init() {
        self.number = 555;
    }
}
