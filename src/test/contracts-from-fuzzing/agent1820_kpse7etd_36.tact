contract NamedBool {
    yes: Bool = true;
    no: Bool = false;
    maybe: Bool? = null;
    init() {
        self.yes = true;
        self.no = false;
        self.maybe = null;
    }
}