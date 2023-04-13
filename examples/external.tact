import "@stdlib/deploy";
import "@stdlib/ownable";

message Increment {
    value: Int;
}

contract External with Deployable, Ownable {
    owner: Address;
    timeout: Int;

    init(owner: Address) {
        self.owner = owner;
        self.timeout = now() + 5 * 60; // 5 minutes
    }

    receive("Topup") {
        // Do nothing
    }

    external("Timeout") {
        if (now() > self.timeout) {
            acceptMessage();
        }
    }

    external(msg: Increment) {
        if (msg.value == now()) {
            acceptMessage();
        }
    }
}