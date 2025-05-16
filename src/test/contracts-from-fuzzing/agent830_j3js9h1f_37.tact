struct Mixed {
    foo: Int;
    bar: Bool?;
    baz: String;
    msg: Msg?;
}

message(0x33333333) Msg {}

contract TestMixed {
    data: Mixed;
    init() {
        self.data = Mixed{
            foo: 17,
            bar: null,
            baz: "hi",
            msg: null
        };
    }
}