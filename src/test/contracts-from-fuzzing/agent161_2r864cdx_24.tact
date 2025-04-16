contract MultiString {
    name: String;
    symbol: String;
    largeDesc: String;

    init() {
        self.name = "TOKEN";
        self.symbol = "TKN";
        self.largeDesc = "This is a large description string to test storage of strings";
    }

    receive() {}
}