message Greet {
    text: String;
}

contract TestContract {
    saved: Greet?;

    init() {
        self.saved = Greet{ text: "Hello" };
    }
}