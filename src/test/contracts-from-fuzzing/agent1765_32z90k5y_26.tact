message(1) M {
    x: Int = 7;
}

struct Pack {
    msg: M = M{};
    flag: Bool = true;
}

contract MsgInStructDefault {
    data: Pack = Pack{};
}