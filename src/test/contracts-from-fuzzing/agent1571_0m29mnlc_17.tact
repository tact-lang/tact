struct StrData {
    text: String;
}

contract TestContract {
    data: StrData = StrData{ text: "" };

    init() {
        self.data = StrData{
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        };
    }
}