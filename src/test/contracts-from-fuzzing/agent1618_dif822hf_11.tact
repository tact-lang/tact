struct StringFields {
    a: String;
    b: String?;
    c: String;
    d: String?;
}

contract TestContract {
    data: StringFields;

    init() {
        self.data = StringFields{
            a: "hello",
            b: null,
            c: "world",
            d: "!"
        };
    }
}