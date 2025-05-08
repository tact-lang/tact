struct SerializeFormats {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint32;
    d: Int;
    e: Int as int64;
}

contract ManyFormats {
    sf: SerializeFormats = SerializeFormats{a: 1, b: -5, c: 99, d: 1000, e: -64};
}