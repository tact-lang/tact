message BouncedMsg {
    num: Int;
}

contract BounceReceiver {
    counter: Int;

    init() {
        self.counter = 0;
    }

    // when receiving the "increase" message, send a bounceable message
    receive("increase") {
         self.counter += 1;
         send(SendParameters{
             to: sender(),
             value: 0,
             bounce: true,
             mode: SendRemainingValue,
             body: BouncedMsg{ num: self.counter }.toCell()
         });
    }

    // bounced message receiver - resets the counter when a bounced message is received
    bounced(msg: bounced<BouncedMsg>) {
         self.counter = 0;
    }
}
