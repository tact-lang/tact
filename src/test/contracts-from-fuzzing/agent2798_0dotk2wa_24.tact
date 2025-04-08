struct MixNullable {
    a: Int?;
    b: Bool;
    c: String?;
    d: Bool?;
    e: String;
}

contract MixNullableContract {
    data: MixNullable;

    init() {
        self.data = MixNullable{
            a: null,
            b: true,
            c: null,
            d: false,
            e: "text"
        };
    }
}