contract EmptyStringVsNullOptional {
    x: String;
    y: String?;

    init() {
        self.x = "";
        self.y = null;
    }
}