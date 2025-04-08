struct Info {
    data: String;
    flag: Bool?;
}

message Msg {
    payload: Info?;
}

contract TestContract {
    m: Msg;

    init() {
        self.m = Msg{payload: null};
    }
}