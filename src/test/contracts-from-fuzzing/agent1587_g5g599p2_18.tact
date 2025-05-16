// Struct with fields of various primitive types and optionals mixed
struct Variety {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract MixedFields {
    val: Variety;

    init() {
        self.val = Variety{
            a: 1,
            b: null,
            c: false,
            d: null,
            e: "str",
            f: null,
        };
    }
}