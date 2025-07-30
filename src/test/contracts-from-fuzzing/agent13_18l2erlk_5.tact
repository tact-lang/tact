message Ping {}
message Pong {}

contract A {
    // Bounce receiver for Ping: when a bounced Ping is received, reply with a bounce message
    bounced(msg: bounced<Ping>) {
        // In a bounce scenario, we reply back
        self.reply("Bounce Ping received".asComment());
    }

    // receive function to trigger sending a Ping message
    receive("ping") {
        send(SendParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: Ping{}.toCell()
        });
    }
}

contract B {
    // Bounce receiver for Pong: when a bounced Pong is received, notify with a comment
    bounced(msg: bounced<Pong>) {
        self.notify("Bounce Pong received".asComment());
    }

    // receive function to trigger sending a Pong message
    receive("pong") {
        send(SendParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: Pong{}.toCell()
        });
    }
}
