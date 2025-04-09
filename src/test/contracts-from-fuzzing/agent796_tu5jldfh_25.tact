// Struct with message inside, edge test
message(123) Msg {
    val: Int;
}

struct HoldsMsg {
    content: Msg;
}

contract TestContract {
    s: HoldsMsg;

    init() {
        self.s = HoldsMsg{
            content: Msg{ val: 1 }
        };
    }
}