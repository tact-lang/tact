message Empty {}

contract BounceTryCatch {
    bounced(msg: bounced<Empty>) {
        // Attempt to use a try-catch block inside a bounced receiver
        try {
            require(false, "boom");
        } catch(e) {
            // On error, send a reply
            self.reply("caught".asComment());
        }
    }
}
