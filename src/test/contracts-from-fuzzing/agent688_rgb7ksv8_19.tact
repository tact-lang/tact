message(55) MyMsg {
    foo: Int?;
}

struct Container {
    m: MyMsg?;
    info: String;
}

contract MsgInsideStructOpt {
    data: Container;

    init() {
        self.data = Container{
            m: null,
            info: "abc"
        };
    }
}
