struct BigNested {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int;
    e: Bool;
    f: String;
}

contract VariousTypes {
    data: BigNested;

    init() {
        self.data = BigNested{
            a: null,
            b: true,
            c: null,
            d: 1,
            e: false,
            f: "hi"
        };
    }
}