message(42) InnerMsg {
    foo: Int;
}

struct Middle {
    m: InnerMsg;
    flag: Bool;
}

struct Container {
    middle: Middle;
    label: String;
}

contract MsgNestPersist {
    data: Container;

    init() {
        self.data = Container{
            middle: Middle{
                m: InnerMsg{ foo: 7 },
                flag: true
            },
            label: "nested message in struct"
        };
    }
}