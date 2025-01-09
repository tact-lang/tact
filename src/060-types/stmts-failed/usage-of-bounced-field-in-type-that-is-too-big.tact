primitive Int;
trait BaseTrait { }

message Withdraw {
    data: Int as uint128;
    amount: Int as uint128; // exceeds 224 bytes
}

contract Fund {
    balance: Int as uint256 = 0;

    bounced(msg: bounced<Withdraw>){
        self.balance += msg.data; // ok
        self.balance += msg.amount;
    }
}
