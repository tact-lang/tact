contract OuterFixed2 {
    self_addr: Address;

    init() {
         self.self_addr = address("0:0000000000000000000000000000000000000000000000000000000000000000");
    }

    bounced(rawMsg: Slice) {
        // Handle any bounced messages
    }

    receive("send_inner") {
        send(SendParameters{
            to: address("0:1111111111111111111111111111111111111111111111111111111111111111"),
            value: 0,
            bounce: true,
            mode: SendRemainingValue,
            body: "Bounce test".asComment()
        });
    }

    receive("self_bounce") {
        send(SendParameters{
            to: self.self_addr,
            value: 0,
            bounce: true,
            mode: SendRemainingValue,
            body: "Self bounce".asComment()
        });
    }
}
