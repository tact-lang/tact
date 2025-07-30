message BounceMsg {}

contract TestBounceRecursiveB {
    receive("trigger") {
        require(false, "Forced error");
    }
}

contract TestBounceRecursiveA {
    contractB: Address;
    
    init(b: Address) {
        self.contractB = b;
    }
    
    bounced(msg: bounced<BounceMsg>) {
        send(SendParameters{
            to: self.contractB,
            value: 0,
            mode: SendRemainingValue,
            bounce: true,
            body: BounceMsg{}.toCell()
        });
    }
    
    receive("start") {
        send(SendParameters{
            to: self.contractB,
            value: 0,
            mode: SendRemainingValue,
            bounce: true,
            body: BounceMsg{}.toCell()
        });
    }
}
