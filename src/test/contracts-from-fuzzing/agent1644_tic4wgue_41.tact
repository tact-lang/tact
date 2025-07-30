struct Weird {
    a: Int as uint8 = 3;
    b: Int? as int4 = null;
    c: String = "hello";
}

contract WeirdDefaultsNested {
    w: Weird = Weird{};

    init() {}
}