message Empty {}

contract TestBouncedSender {
    bounced(msg: bounced<Empty>) {
        // Test retrieval of sender in a bounced receiver
        let addr = sender();
    }
}

contract BounceNotify {
    bounced(msg: bounced<Empty>) {
        // Calling self.notify from within a bounced receiver
        self.notify("notification".asComment());
    }
}
