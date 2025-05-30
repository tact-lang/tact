message BounceMsg {
    counter: Int as uint64;
}

contract RecursiveBounceFixed {
    myAddress: Address;

    init(myAddress: Address) {
        self.myAddress = myAddress;
    }

    bounced(msg: bounced<BounceMsg>) {
         if (msg.counter < 3) {
            send(SendParameters{
                to: self.myAddress,
                value: 0,
                mode: SendRemainingValue,
                bounce: true,
                body: BounceMsg{ counter: msg.counter + 1 }.toCell()
            });
         }
    }

    receive(msg: BounceMsg) {
         require(false, "Forcing bounce from receive");
    }
}
