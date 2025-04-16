message(0xAB) M { foo: Int; }

contract MsgDefaultVal {
    m: M = M{ foo: 7 };

    init() {}
}