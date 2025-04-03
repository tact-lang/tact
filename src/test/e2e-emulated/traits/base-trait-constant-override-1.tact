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
}

trait OverrideBaseTraitConstant with BaseTrait {
    override const storageReserve: Int = ton("0.1");

    get fun constant(): Int {
        return self.storageReserve;
    }
}

contract TraitsConstantContract with OverrideBaseTraitConstant, TestBaseTrait {
    receive() {}
}

contract TraitsConstantContractZeroReserve with TestBaseTrait {
    receive() {}
}
