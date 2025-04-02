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
    receive(msg: Forward) { self.forward(msg.to, msg.body, msg.bounce, msg.init) }

    receive(msg: Notify) { self.notify(msg.body) }

    receive(msg: Reply) { self.reply(msg.body) }

    get fun constant(): Int {
        return self.storageReserve;
    }
}

trait OverrideBaseTraitConstant with BaseTrait {
    override const storageReserve: Int = 100;
}

contract TraitsConstantContract with OverrideBaseTraitConstant, TestBaseTrait {
    receive() {}
}

contract TraitsConstantContractZeroReserve with TestBaseTrait {
    receive() {}
}
