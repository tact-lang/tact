struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ManyOptionals {
    data: S;

    init() {
        self.data = S{
            a: 1,
            b: true,
            c: "hello",
            d: null,
            e: null,
            f: null,
        };
    }
}