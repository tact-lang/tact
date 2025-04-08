contract NestedMessageStruct {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            msg: TestMsg{ val: 777 }
        };
    }
}

struct Wrapper {
    msg: TestMsg;
}

message(0x42) TestMsg {
    val: Int;
}
