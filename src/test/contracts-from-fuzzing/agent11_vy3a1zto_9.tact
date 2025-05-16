message Empty {}

contract RecursiveBounce {
    bounced(msg: bounced<Empty>) {
        // Attempt to call self.reply within the bounce receiver to simulate recursive bounce behavior
        // Using a well-formed address literal for the reply, even though reply doesn't use an address literal
        self.reply("recursive bounce reply".asComment());
    }
}
