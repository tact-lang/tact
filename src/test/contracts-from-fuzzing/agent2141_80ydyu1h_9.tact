struct StringHolder {
    a: String;
    b: String;
    c: String?;
    d: String?;
}

contract TestContract {
    s: StringHolder;

    init() {
        self.s = StringHolder{
            a: "Hello",
            b: "World",
            c: null,
            d: "!"
        };
    }
}