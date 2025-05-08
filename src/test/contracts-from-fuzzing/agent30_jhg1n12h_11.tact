message ChainMsg {}

contract ChainNonResponder {
    // This contract intentionally does not have a receive function,
    // so any message sent to it with bounce: true will bounce back.
}

contract ChainBounce {
    nonResponder: Address;
    stage1: Bool;
    stage2: Bool;
    final: Bool;

    init(nonResponder: Address) {
        self.nonResponder = nonResponder;
        self.stage1 = false;
        self.stage2 = false;
        self.final = false;
    }

    // Trigger the first outbound message to a non-responsive contract
    receive("start") {
        self.forward(self.nonResponder, ChainMsg{}.toCell(), true, null);
    }

    // Handle bounced messages and chain further bounce attempts
    bounced(msg: bounced<ChainMsg>) {
        if (!self.stage1) {
            self.stage1 = true;
            self.forward(self.nonResponder, ChainMsg{}.toCell(), true, null);
        } else if (self.stage1 && !self.stage2) {
            self.stage2 = true;
            self.forward(self.nonResponder, ChainMsg{}.toCell(), true, null);
        } else {
            self.final = true;
        }
    }
}
