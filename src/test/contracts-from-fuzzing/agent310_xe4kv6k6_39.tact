struct EdgeCase {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract EdgePersistence {
    data: EdgeCase;
    init() {
        self.data = EdgeCase{
            a: 1,
            b: null,
            c: true,
            d: false,
            e: "x",
            f: null
        };
    }
}