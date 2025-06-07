// nested message in struct stored as persistent state
message(0x12345678) Msg {
    a: Int;
    b: Bool;
}

struct Wrapper {
    m: Msg;
    other: Int;
}

contract TestContract {
    data: Wrapper;
    init() {
        self.data = Wrapper{
            m: Msg{a: 5, b: true},
            other: 123
        };
    }
}