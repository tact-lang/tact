message(0x111) Info {
    data: String;
}

struct Complex {
    amount: Int;
    msg: Info?;
}

contract MsgNestedStruct {
    field: Complex;

    init() {
        self.field = Complex{
            amount: 777,
            msg: null
        };
    }
}