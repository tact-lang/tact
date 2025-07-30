contract OnlyStrings {
    title: String;
    subtitle: String;
    description: String;

    init() {
        self.title = "Title";
        self.subtitle = "Sub";
        self.description = "Desc";
    }
}