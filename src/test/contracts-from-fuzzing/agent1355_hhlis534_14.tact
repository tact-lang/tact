struct Rec {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract Variety {
    data: Rec;

    init() {
        self.data = Rec{
            a: 1,
            b: "hello",
            c: true,
            d: null,
            e: null,
            f: null,
        };
    }
    receive() {}
}