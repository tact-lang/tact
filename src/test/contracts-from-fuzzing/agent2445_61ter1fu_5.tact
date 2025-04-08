message(1) Info {
    text: String;
}

contract Test {
    info: Info?;

    init() {
        self.info = Info{
            text: "Hello",
        };
    }

    receive() {}
}