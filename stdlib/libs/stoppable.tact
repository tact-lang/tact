@interface("org.ton.stoppable")
trait Stoppable with Ownable {
    
    stopped: Bool;
    owner: Address;

    fun requireNotStopped() {
        require(!self.stopped);
    }

    receive("Stop") {
        self.requireOwner();
        self.requireNotStopped();
        self.stopped = true;
        reply("Stopped".asComment());
    }

    get fun stopped(): Bool {
        return self.stopped;
    }
}