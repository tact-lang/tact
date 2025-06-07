message(0xBEEF) MsgPayload {
    x: Int;
    y: Bool;
}

struct Composite {
    label: String;
    payload: MsgPayload;
    flag: Bool;
}

contract TestContract {
    info: Composite;

    init() {
        self.info = Composite{
            label: "combo",
            payload: MsgPayload{
                x: 12345,
                y: true
            },
            flag: false
        };
    }
}