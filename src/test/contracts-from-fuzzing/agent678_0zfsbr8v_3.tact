struct OneHasOptional {
    a: Int;
    b: Int?;
    c: Bool?;
    d: String;
    e: String?;
    f: Bool;
}

contract OptionalFields {
    data: OneHasOptional;

    init() {
        self.data = OneHasOptional{
            a: 1,
            b: null,
            c: true,
            d: "hello",
            e: null,
            f: false
        };
    }
}