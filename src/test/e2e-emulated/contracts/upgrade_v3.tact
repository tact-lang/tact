import "@stdlib/deploy";
import "@stdlib/upgrade";

message Add {
    amount: Int as uint32;
}

contract SampleUpgradeContractV3 with Upgradable {
    version: Int as uint32 = 0;

    owner: Address;
    counter: Int as int32;

    init(owner: Address) {
        self.owner = owner;
        self.counter = 0;
    }

    receive() {}

    fun add(v: Int) {
        let ctx: Context = context();
        require(ctx.sender == self.owner, "Invalid sender");

        self.counter += v;
    }

    receive("increment") {
        self.add(1);
    }

    receive("decrement") {
        self.counter -= 1;
    }

    get fun counter(): Int {
        return self.counter;
    }
}
