message (123) Info {
    value: Int;
}

contract MessageStore {
    info: Info;

    init() {
        self.info = Info {
            value: 321,
        };
    }

    receive() {}
}
