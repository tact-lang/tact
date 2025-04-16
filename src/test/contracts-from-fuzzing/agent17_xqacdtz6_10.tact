message RecurMsg {
    dummy: Int;
}

contract RecA {
    bounced(msg: bounced<RecurMsg>) {
         // On receiving a bounced message, send a reply that is bounceable
         self.reply("RecA bounce reply".asComment());
         return;
    }
    
    receive("trigger") {
         // Forward a message to a dummy address; since no contract is deployed at this address,
         // the message is expected to bounce back
         self.forward(
             address("0:1111111111111111111111111111111111111111111111111111111111111111"),
             RecurMsg{dummy: 1}.toCell(),
             true,
             null
         );
    }
}

contract RecB {
    // This contract does not handle RecurMsg, so any message sent to it will bounce
    receive(msg: Slice) {
         return;
    }
}
