message Ping {}

contract RecursiveBounce {
    get fun ping() : Int {
         self.forward(myAddress(), "ping".asComment(), true, null);
         return 1;
    }

    bounced(msg: bounced<Ping>) {
         self.forward(myAddress(), "ping bounce".asComment(), true, null);
    }
}
