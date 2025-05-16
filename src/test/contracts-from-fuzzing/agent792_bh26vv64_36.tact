struct StringData {
    a: String;
    b: String?;
    c: String;
}

contract TestC {
    sd: StringData;

    init() {
        self.sd = StringData{
            a: "Hello",
            b: null,
            c: "World"
        };
    }
}