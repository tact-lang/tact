struct Strs {
    a: String;
    b: String?;
    c: String;
    d: String?;
}

contract TestContract {
    strData: Strs;

    init() {
        self.strData = Strs{
            a: "hello",
            b: null,
            c: "world",
            d: "!"
        };
    }
}