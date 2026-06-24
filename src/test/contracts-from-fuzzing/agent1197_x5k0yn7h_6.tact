struct HasString {
    desc: String;
}

contract TestContract {
    state: HasString;

    init() {
        self.state = HasString{ desc: "Hello" };
    }
}