message Msg { foo: Int; }

contract MsgAsField {
    m: Msg = Msg{foo: 7};
}