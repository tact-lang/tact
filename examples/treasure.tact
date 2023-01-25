import "@stdlib/ownable";

message Withdraw {
    amount: Int as coins;
    mode: Int as uint8;
}

contract Treasure with OwnableTransferable {
    owner: Address;
    
    init(owner: Address) {
        self.owner = owner;
    }

    fun doWithdraw(amount: Int, mode: Int) {
        
        // Only owner can withdraw
        self.requireOwner();

        // Perform withdraw
        send(SendParameters{value: amount, to: self.owner, mode: mode, body: beginCell().endCell()});
    }

    receive(msg: Withdraw) {
        self.doWithdraw(msg.amount, msg.mode);
    }

    receive("Destroy") {
        self.doWithdraw(0, 32 + 128);
    }
}