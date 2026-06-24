message Ping {
    text: String;
}

contract MiddleContract {
    recovery: Address;

    init(recovery: Address) {
        self.recovery = recovery;
    }

    // No receive defined, so any incoming message will bounce
    bounced(msg: bounced<Ping>) {
        // Forward the bounced message to a recovery contract
        self.forward(self.recovery, "Middle bounce handling".asComment(), false, null);
    }
}

contract RecoveryContract {
    bounced(msg: bounced<Ping>) {
        // Handle the bounce in the recovery contract
    }

    receive() {
        // Normal receive function
    }
}

contract Initiator {
    bounced(msg: bounced<Ping>) {
        // Handle bounce directly in initiator as fallback
    }

    fun sendPing(target: Address) {
        send(SendParameters{
            to: target,
            value: ton("0.02"),
            bounce: true,
            mode: SendRemainingValue,
            body: Ping{text: "Hello from Initiator"}.toCell()
        });
    }

    receive() {
        // Normal receive function
    }
}
