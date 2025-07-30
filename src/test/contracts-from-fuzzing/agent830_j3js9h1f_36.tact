message(0x55555555) Msg1 {}
message(0x66666666) Msg2 {}

struct MessagesStruct {
    a: Msg1;
    b: Msg2;
}

contract TestMultiMessages {
    field: MessagesStruct;
    init() {
        self.field = MessagesStruct{ a: Msg1{}, b: Msg2{} };
    }
}