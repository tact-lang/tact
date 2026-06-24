struct Info {
    a: Int;
    b: String?;
}

message(42) Msg {
    info: Info;
    flag: Bool;
}

struct Wrapper {
    m: Msg;
    label: String;
}

contract TestContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            m: Msg{
                info: Info{
                    a: 7,
                    b: "hi",
                },
                flag: true,
            },
            label: "wrap",
        };
    }
}