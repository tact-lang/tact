struct Info {
    data: String;
    count: Int;
}

message(7) Wrapper {
    info: Info;
    ok: Bool;
}

contract TestContract {
    m: Wrapper;

    init() {
        self.m = Wrapper{
            info: Info{ data: "hello", count: 9 },
            ok: true,
        };
    }
}