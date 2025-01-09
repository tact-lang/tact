primitive Int;
trait BaseTrait { }

message Withdraw {
    data128: Int as uint128; // 128
    data64: Int as uint64; // 192
    data16: Int as uint16; // 208
    data8: Int as uint8; // 216
    data4: Int as uint4; // 220
    data4_2: Int as uint4; // 224

    amount: Int as uint128;
}

contract Fund {
    balance: Int as uint256 = 0;

    bounced(msg: bounced<Withdraw>){
        self.balance += msg.data128; // ok
        self.balance += msg.data64; // ok
        self.balance += msg.data16; // ok
        self.balance += msg.data8; // ok
        self.balance += msg.data4; // ok
        self.balance += msg.data4_2; // ok

        self.balance += msg.amount;
    }
}
