struct Many {
    a: Int = 1;
    b: Int = 2;
    c: Bool = true;
    d: Bool = false;
    e: Int as uint8 = 8;
    f: Int as uint32 = 32;
    g: Int as int32 = -32;
    h: Int = -1000;
    i: Address;
    j: String = "hello";
    k: Bool = false;
    l: Bool = true;
    m: Int = 1234567890;
    n: Int = -987654321;
    o: Int = 0;
    p: Int = 255;
}

contract Test {
    f: Many = Many{
        i: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c")
    };
}