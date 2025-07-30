struct SingleString {
    text: String;
}

contract StringOnly {
    data: SingleString;

    init() {
        self.data = SingleString{ text: "Just text" };
    }
}