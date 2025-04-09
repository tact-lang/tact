struct BigString {
    text: String;
    number: Int;
}

contract TestContract {
    item: BigString;

    init() {
        self.item = BigString{
            text: "Hello World!",
            number: 77
        };
    }
}