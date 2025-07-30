struct WithString {
    s: String;
    n: Int;
    o: Bool?;
}

contract StringInside {
    info: WithString;

    init() {
        self.info = WithString{
            s: "hello",
            n: 77,
            o: null,
        };
    }
}