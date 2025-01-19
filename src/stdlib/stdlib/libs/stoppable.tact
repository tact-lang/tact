import "./ownable";

@interface("org.ton.stoppable")
trait Stoppable with Ownable {
    
    stopped: Bool;
    owner: Address;

    fun requireNotStopped() {
        require(!self.stopped, "Contract stopped");
    }

    fun requireStopped() {
        require(self.stopped, "Contract not stopped");
    }

    receive("Stop") {
        self.requireOwner();
        self.requireNotStopped();
        self.stopped = true;
        self.reply("Stopped".asComment());
    }

    get fun stopped(): Bool {
        return self.stopped;
    }
}

@interface("org.ton.resumable")
trait Resumable with Stoppable {
    stopped: Bool;
    owner: Address;

    receive("Resume") {
        self.requireOwner();
        self.requireStopped();
        self.stopped = false;
        self.reply("Resumed".asComment());
    }
}