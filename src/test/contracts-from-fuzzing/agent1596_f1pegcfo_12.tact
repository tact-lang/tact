struct Sub {
    x: Int as uint8 = 12;
    y: Bool = true;
}

struct HasFormats {
    a: Int as int32 = -123;
    b: Bool?;
    c: Sub;
    d: Int?;
}

contract Test {
    data: HasFormats = HasFormats{ c: Sub{} };
    init() {}
}