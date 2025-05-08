message Msg {
    content: String;
}

contract BounceCycle2 {
    counter: Int;

    init() {
        self.counter = 0;
    }

    // Initiates bounce cycle
    receive("start") {
        self.reply("starting bounce".asComment());
    }

    // Bounce receiver: on bounce, increment counter and optionally bounce again
    bounced(msg: bounced<Msg>) {
        self.counter = self.counter + 1;
        if (self.counter < 3) {
            self.reply("recursive bounce".asComment());
        }
    }
}
