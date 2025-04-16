struct Plain {
    p: Int;
}

contract ManySameTypeStructs {
    a: Plain = Plain{ p:1 };
    b: Plain = Plain{ p:2 };
    c: Plain = Plain{ p:3 };
}