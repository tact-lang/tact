struct Info {
    v1: Int;
    v2: Int?;
    flag: Bool;
    text: String;
}

contract TestContract {
    info: Info = Info{
        v1: 123,
        v2: null,
        flag: true,
        text: "hello"
    };

    init() {
        self.info = Info{
            v1: 456,
            v2: 789,
            flag: false,
            text: "world"
        };
    }
    receive(){}
}