struct Strings {
    a: String;
    b: String;
    c: String;
}

contract TestContract {
    texts: Strings;

    init() {
        self.texts = Strings{
            a: "hello",
            b: "world",
            c: "!"
        };
    }
}