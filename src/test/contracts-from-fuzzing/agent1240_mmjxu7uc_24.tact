contract MsgOpt {
    data: Container;

    init() {
        self.data = Container{
            maybe: null
        };
    }
}

struct Container {
    maybe: TestMsg?;
}

message(123) TestMsg {
    val: Int;
}
