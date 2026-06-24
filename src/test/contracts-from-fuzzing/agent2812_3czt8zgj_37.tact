struct Bottom {
    z: Int;
}

struct Middle {
    y: Bottom;
}

struct Top {
    x: Middle;
}

contract FieldsDefault {
    nested: Top = Top{ x: Middle{ y: Bottom{ z: 10 } } };
    flag: Bool = true;

    init() {}
}