primitive Int;
trait BaseTrait { }

message Withdraw {
    amount: Int as uint256; // too big
}

contract Fund {
    balance: Int as uint256 = 0;

    bounced(msg: bounced<Withdraw>){
        self.balance += msg.amount;
    }
}
