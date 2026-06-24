message AMsg {
    value: Int;
}

message BMsg {
    value: Int;
}

contract A {
    // Bounce receiver for bounce messages of type BMsg
    bounced(msg: bounced<BMsg>) {
        // On receiving a bounced BMsg, reply back
        self.reply("Bounce A response".asComment());
    }

    // Initial receiver to trigger bounce scenario
    receive("start") {
        // Send an AMsg to sender (expected to bounce if not processed by recipient)
        self.forward(sender(), AMsg{value: 1}.toCell(), true, null);
    }
}

contract B {
    // B does not define a receiver for AMsg, so AMsg will bounce back
    // Bounce receiver for bounce messages of type AMsg
    bounced(msg: bounced<AMsg>) {
        // On bounce, reply back
        self.reply("Bounce B response".asComment());
    }

    // Generic fallback receiver to catch any message that's not handled
    receive(msg: Slice) {
        // No processing
        return;
    }
}
