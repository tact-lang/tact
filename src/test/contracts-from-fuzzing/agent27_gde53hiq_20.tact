struct Info {
    id: Int;
    name: String;
}

message(0xCCC) Wrapper {
    info: Info;
    code: Int as uint32;
}

contract TestContract {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            info: Info{id: 1, name: "me"},
            code: 42
        };
    }
}