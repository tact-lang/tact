struct Container {
    value: Int as int64;
    flag: Bool;
    text: String;
}

contract NoDefaults {
    state: Container;

    init() {
        self.state = Container{
            value: 123,
            flag: true,
            text: "hi"
        };
    }
}
