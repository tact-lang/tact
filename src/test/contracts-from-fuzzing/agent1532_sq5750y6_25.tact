struct S2 { a: Int; b: String; c: Int?; d: Bool; e: Bool?; f: String; }

contract DiffTypes {
    x: S2;

    init() {
        self.x = S2{
            a: 123,
            b: "str",
            c: null,
            d: true,
            e: false,
            f: "str2",
        };
    }
}