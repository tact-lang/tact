contract LongStrings {
    name: String = "Short";
    longString: String = "";

    init() {
        self.name = "Changed";
        self.longString = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
    }
}