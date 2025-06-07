message(42) Notice {
    id: Int as uint64;
    note: String;
}

struct Notification {
    msg: Notice;
    timestamp: Int;
}

contract MsgAsField {
    notif: Notification;

    init() {
        self.notif = Notification{
            msg: Notice{ id: 999, note: "hello" },
            timestamp: 321
        };
    }
}