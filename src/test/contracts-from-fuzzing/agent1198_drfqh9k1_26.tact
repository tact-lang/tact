message(0x1234) MetaMsg {
    note: String;
}

struct Wrapper {
    someInt: Int;
    inner: MetaMsg;
}

contract MsgInStruct {
    wrapper: Wrapper;

    init() {
        self.wrapper = Wrapper{
            someInt: 42,
            inner: MetaMsg{ note: "hello" }
        };
    }

    receive() {
        self.wrapper = self.wrapper;
    }
}