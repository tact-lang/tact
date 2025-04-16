struct Combine {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract Test40 {
    data: Combine;

    init() {
        self.data = Combine{
            a: 5,
            b: false,
            c: "hi",
            d: null,
            e: true,
            f: "bye"
        };
    }
}