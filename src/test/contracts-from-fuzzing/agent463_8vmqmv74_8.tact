message(12) MsgData {
    x: Int;
}

struct Wrap {
    msg: MsgData?;
}

contract TestContract {
    data: Wrap?;

    init() {
        self.data = null;
    }
}