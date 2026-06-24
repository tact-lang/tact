message Ping {
    n: Int;
}

contract Receiver {
    receive(p: Ping) {
        // Force failure always to trigger a bounce
        require(false, "Force failure to trigger bounce");
    }
}

contract Sender {
    bounced(msg: bounced<Ping>) {
        // Bounce handler: log bounce by doing nothing
    }
    
    fun sendPing(receiver: Address) {
        send(SendParameters{
            to: receiver,
            value: 0,
            bounce: true,
            mode: 0,
            body: Ping{ n: 123 }.toCell()
        });
    }
}
