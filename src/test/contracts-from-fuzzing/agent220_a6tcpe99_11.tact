message(101) MsgStruct {
    foo: Int = 123;
    bar: Bool?;
}

contract MsgFieldTest {
    ms: MsgStruct;

    init() {
        self.ms = MsgStruct{
            bar: true
        };
    }

    receive() {}
}