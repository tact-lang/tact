message Msg2 {
    s: Int;
}

struct Container {
    m: Msg2;
}

contract MsgInsideStruct {
    data: Container;
    init() {
        self.data = Container{
            m: Msg2{s: 42}
        };
    }
}