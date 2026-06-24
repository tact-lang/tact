struct WideFields {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int as uint8 = 2;
    e: Bool = true;
    f: String = "bye";
    g: Int = 3;
    h: Int as int16 = -7;
}

contract Test {
    data: WideFields = WideFields{};
}