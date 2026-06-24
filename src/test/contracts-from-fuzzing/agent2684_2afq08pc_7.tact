contract BoolDefaults {
    yes: Bool = true;
    no: Bool = false;

    init() {
        self.yes = false;
        self.no = true;
    }
}
