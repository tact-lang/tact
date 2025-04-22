message ForwardMsg {
    to: Address;
    body: Cell?;
    bounce: Bool;
    init: StateInit?;
}

message NotifyMsg {
    body: Cell?;
}

message ReplyMsg {
    body: Cell?;
}

contract BaseTraitTest {
    receive(msg: ForwardMsg) { self.forward(msg.to, msg.body, msg.bounce, msg.init) }

    receive(msg: NotifyMsg) { self.notify(msg.body) }

    receive(msg: ReplyMsg) { self.reply(msg.body) }
}