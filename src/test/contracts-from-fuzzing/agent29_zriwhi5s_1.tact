message MyMsg {
    data: Int;
}

contract BounceTest {
    // Standard receiver that might trigger bounce
    receive() {
        // Sending a message with bounce flag enabled
        self.reply("Trigger bounce".asComment());
    }

    // Bounced message receiver using a typed message
    bounced(msg: bounced<MyMsg>) {
        // Handling bounced message (for instance, reset some state)
        // Here we simply leave the handler empty
    }
}
