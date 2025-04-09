struct Textual {
    a: String;
    b: String?;
    c: String;
    d: String?;
}

contract OnlyStrings {
    stringsData: Textual;

    init() {
        self.stringsData = Textual{
            a: "hello",
            b: null,
            c: "world",
            d: null
        };
    }

    receive() {
        if (self.stringsData.b != null) {
            dump(self.stringsData.b!!);
        }
    }
}