struct HasString {
    s: String;
    b: Bool;
}

contract TestContract {
    f: HasString;

    init() {
        self.f = HasString{
            s: "hello",
            b: true
        };
    }
}