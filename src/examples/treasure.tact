import "@stdlib/ownable";

message Withdraw {
    amount: Int as coins;
    mode: Int as uint8;
}

contract Treasure {
    owner: Address;
    
    init(owner: Address) {
        self.owner = owner;
    }

    fun doWithdraw(amount: Int, mode: Int) {
        send(SendParameters{value: amount, to: self.owner, mode: mode, body: endCell(beginCell())});
    }

    receive(msg: Withdraw) {
        self.doWithdraw(msg.amount, msg.mode);
    }

    receive(msg: ChangeOnwer) {
        self.owner = msg.newOwner;
    }

    receive("Destroy") {
        self.doWithdraw(0, 0); // TODO: Update flags
    }
}