contract RugPull {

    scammer: Address;
    rugpulled: Bool;
    queueStart: Int;
    queueEnd: Int;
    queue: map[Int]Address;
    
    init(scammer: Address) {
        self.scammer = scammer;
        self.rugpulled = false;
        self.queueStart = 0;
        self.queueEnd = 0;
    }

    receive() {
        if (self.rugpulled) {
            // Forward everything to owner
            // TODO: Implement
        } else {
            // TODO: Implement
        }
    }

    receive("rugpull") {
        self.rugpulled = true;
    } 
}