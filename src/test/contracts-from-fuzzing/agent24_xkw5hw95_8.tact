contract ReceiverChain {
    // This contract always fails on receiving a message, forcing a bounce
    receive() {
        require(false, "Forced failure in ReceiverChain");
    }
}

contract CallerChain {
    chainBounced: Bool;

    init() {
         self.chainBounced = false;
    }

    fun call(target: Address) {
         send(SendParameters{
            to: target,
            value: ton("1"),
            bounce: true,
            body: "Chain bounce test".asComment()
         });
    }

    bounced(raw: Slice) {
         self.chainBounced = true;
    }
}
