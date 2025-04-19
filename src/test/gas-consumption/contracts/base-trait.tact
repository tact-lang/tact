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

trait TestBaseTrait with BaseTrait{
    receive(msg: ForwardMsg) { self.forward(msg.to, msg.body, msg.bounce, msg.init) }

    receive(msg: NotifyMsg) { self.notify(msg.body) }

    receive(msg: ReplyMsg) { self.reply(msg.body) }
}


contract BaseTraitInline  {
    receive(msg: ForwardMsg) { self.forward(msg.to, msg.body, msg.bounce, msg.init) }

    receive(msg: NotifyMsg) { self.notify(msg.body) }

    receive(msg: ReplyMsg) { self.reply(msg.body) }
}

contract BaseTraitTrait with TestBaseTrait {
    receive() {}
}