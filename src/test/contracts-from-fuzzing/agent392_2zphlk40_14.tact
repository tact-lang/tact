contract OnlyStrings {
    name: String;
    city: String;
    country: String;

    init() {
        self.name = "Alice";
        self.city = "NYC";
        self.country = "USA";
    }
}
