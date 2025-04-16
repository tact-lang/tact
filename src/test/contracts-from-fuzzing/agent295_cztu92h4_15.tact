// Huge struct with all optional fields, persistent
struct BigOptional {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: String?;
    f: Address?;
    g: Cell?;
    h: Slice?;
    i: String?;
    j: Int?;
}

contract BigOptionalPersist {
    x: BigOptional = BigOptional{
        a: null, b: null, c: null, d: null,
        e: null, f: null, g: null, h: null,
        i: null, j: null
    };

    init() {
        self.x = BigOptional{
            a: 1, b: 2, c: true, d: false,
            e: "E", f: myAddress(),
            g: emptyCell(), h: emptyCell().asSlice(),
            i: "I", j: 99
        };
    }

    receive() {
        self.x = self.x;
    }
}