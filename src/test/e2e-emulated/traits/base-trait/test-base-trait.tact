message MessageAndForward {
    mode: Int;
    value: Int as coins;
    to: Address;
    body: Cell?;
    bounce: Bool;
    init: StateInit?;
}

message Reserving {
    reserve: Int;
    reserveMode: Int;
    to: Address;
    body: Cell?;
    bounce: Bool;
    init: StateInit?;
}

message DoubleForward {
    to: Address;
    body: Cell?;
    bounce: Bool;
    init: StateInit?;
}

message Forward {
    to: Address;
    body: Cell?;
    bounce: Bool;
    init: StateInit?;
}

message Notify {
    body: Cell?;
}

message Reply {
    body: Cell?;
}

trait TestBaseTrait with BaseTrait {
    receive(msg: DoubleForward) {
        self.forward(msg.to, msg.body, msg.bounce, msg.init);

        self.forward(msg.to, msg.body, msg.bounce, msg.init);
    }

    receive(msg: Reserving) {
        nativeReserve(msg.reserve, msg.reserveMode);
        self.forward(msg.to, msg.body, msg.bounce, msg.init);
    }

    receive(msg: MessageAndForward) {
        message(MessageParameters {
            mode: msg.mode,
            to: msg.to,
            body: msg.body,
            value: msg.value,
        });

        self.forward(msg.to, msg.body, msg.bounce, msg.init);
    }

    receive(msg: Forward) { self.forward(msg.to, msg.body, msg.bounce, msg.init) }

    receive(msg: Notify) { self.notify(msg.body) }

    receive(msg: Reply) { self.reply(msg.body) }
}
