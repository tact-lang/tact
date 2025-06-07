struct Serialize {
    a: Int as int8;
    b: Int as uint32;
    c: Bool;
    d: String;
    e: Int?;
}

contract TestContract {
    field: Serialize;

    init() {
        self.field = Serialize{
            a: 1,
            b: 2,
            c: false,
            d: "hi",
            e: null
        };
    }
}