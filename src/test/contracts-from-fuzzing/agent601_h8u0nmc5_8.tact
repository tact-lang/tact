struct HasString {
    s: String;
    b: Bool;
    i: Int;
}

contract StringContract {
    data: HasString;

    init() {
        self.data = HasString{
            s: "hello",
            b: true,
            i: 42,
        };
    }
}
