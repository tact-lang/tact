message(0x1) Event {
    descr: String;
}

struct NestedMsg {
    evt: Event?;
    code: Int;
}

struct Wrapper {
    info: NestedMsg?;
    flag: Bool;
}

contract NestedNullableWithMessage {
    state: Wrapper;

    init() {
        self.state = Wrapper{
            info: null,
            flag: true
        };
    }
}