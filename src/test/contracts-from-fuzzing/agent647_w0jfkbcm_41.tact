// optionals mixed with serialized integers and string in struct
struct Mix {
    a: Int?;
    b: Int as uint8;
    c: String?;
    d: Bool?;
    e: Int as int16;
}

contract TestContract {
    m: Mix;

    init() {
        self.m = Mix{
            a: null,
            b: 255,
            c: null,
            d: null,
            e: -32768
        };
    }
}