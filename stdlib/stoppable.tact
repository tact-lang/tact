trait Stoppable with Ownable {
    stopped: Bool;
    owner: Address;

    fun requireNotStopped() {
        require(!self.stopped);
    }

    receive("stop") {
        self.requireOwner();
        self.requireNotStopped();
        self.stopped = true;
    }
}