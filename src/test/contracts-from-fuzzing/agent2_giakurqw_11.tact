message Ping {
    n: Int;
}

// A contract that always fails when receiving a Ping, causing the message to bounce
contract ReceiverFail {
    receive(p: Ping) {
        require(false, "Always fail to trigger bounce");
    }
}

// A sender contract that sends Ping messages and handles bounced messages
// It is designed to test a multi-level bounce scenario: upon receiving the first bounce, it sends a second Ping to another receiver
contract SenderMulti {
    bounceCount: Int;
    secondReceiver: Address;

    init(second: Address) {
         self.bounceCount = 0;
         self.secondReceiver = second;
    }

    // Bounce receiver for Ping messages
    bounced(msg: bounced<Ping>) {
         // Increment the bounce counter
         self.bounceCount = self.bounceCount + 1;
         // If this is the first bounce, attempt to send a second Ping to the designated second receiver
         if (self.bounceCount == 1) {
              self.sendPing(self.secondReceiver);
         }
    }

    // Function to send a Ping message to a given receiver address
    fun sendPing(receiver: Address) {
         send(SendParameters{
             to: receiver,
             value: 0,
             bounce: true,
             mode: 0,
             body: Ping{ n: 42 }.toCell()
         });
    }
}
