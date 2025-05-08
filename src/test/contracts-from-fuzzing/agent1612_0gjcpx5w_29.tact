struct LargeText {
    message: String;
}

contract StoreLargeText {
    data: LargeText;

    init() {
        self.data = LargeText{
            message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        };
    }
}
