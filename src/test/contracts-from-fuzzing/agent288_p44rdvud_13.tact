struct Info {
    x: Int;
    y: Bool;
}

message(0x55) Msg {
    payload: Info;
    flag: Bool;
}

struct Container {
    innerMsg: Msg;
    extra: Int;
}

contract MixedNested {
    data: Container = Container{
        innerMsg: Msg{
            payload: Info{ x: 1, y: true },
            flag: false
        },
        extra: 7
    };

    init() {
        self.data = Container{
            innerMsg: Msg{
                payload: Info{ x: 42, y: false },
                flag: true
            },
            extra: 77
        };
    }
}