import "@stdlib/deploy";
import "@stdlib/upgrade";

message Add {
    amount: Int as uint32;
}

contract SampleDelayedUpgradeContractV2 with DelayedUpgradable {
    version: Int as uint32 = 0;
    initiated_at: Int = 0;
    upgrade_info: Upgrade = Upgrade{};

    owner: Address;
    counter: Int as uint32;

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
        self.add(100);
    }

    get fun counter(): Int {
        return self.counter;
    }
}
