struct Complex {
    a: Int = 1;
    b: Int as uint8 = 2;
    c: Bool = true;
    d: String?;
    e: Int? as uint16;
    f: String = "sup";
}

contract NoInitMix {
    var: Complex = Complex{
        a: 10,
        b: 20,
        c: false,
        d: "hello",
        e: 255,
        f: "yo"
    };

    receive() {}
}