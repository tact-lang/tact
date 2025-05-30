message(1) Inside {}

struct HasOptMsg {
    foo: Int;
    bar: Inside?;
}

contract OptMsgInStruct {
    data: HasOptMsg;

    init() {
        self.data = HasOptMsg{
            foo: 55,
            bar: null
        };
    }
}
