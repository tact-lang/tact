message(123) SingleMsg { foo: Int }

contract MsgDirect {
    field: SingleMsg;

    init() {
        self.field = SingleMsg{ foo:42 };
    }
}