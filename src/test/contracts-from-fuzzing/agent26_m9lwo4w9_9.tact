message MyMessage { value: Int; }

contract RecursiveBounce {
    receive("trigger") {
         // Intentionally fail to trigger bounce
         require(false, "intentional error");
    }
    
    bounced(msg: bounced<MyMessage>) {
         // Bounce handler responds by sending a reply that may itself bounce
         self.reply("Recursive bounce".asComment());
    }
}
