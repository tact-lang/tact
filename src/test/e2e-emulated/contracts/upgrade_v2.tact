import "@stdlib/deploy";
import "@stdlib/ownable";

/// Message for upgrading contract code and data.
message Upgrade {
    /// Optional new contract code as Cell.
    code: Cell? = null;
    /// Optional new contract data as Cell.
    data: Cell? = null;
}

/// Trait that enables contract upgradeability.
/// Implements basic upgrade mechanism with owner validation.
trait Upgradable with Ownable {
    /// Contract owner address that can perform upgrades.
    owner: Address;

    /// Current contract version, increments after each upgrade.
    version: Int as uint32;

    /// Handles upgrade message.
    /// Validates sender, performs upgrade and increments version.
    receive(msg: Upgrade) {
        let ctx = context();
        self.upgrade_validate(ctx, msg);
        self.upgrade(ctx, msg);

        self.version += 1;
    }

    /// Validates upgrade request.
    /// By default only allows owner to upgrade. Can be overridden.
    virtual inline fun upgrade_validate(ctx: Context, _: Upgrade) {
        self.requireOwner();
    }

    /// Performs the actual upgrade.
    /// Updates contract code and optionally data.
    virtual inline fun upgrade(_: Context, msg: Upgrade) {
        if (msg.code != null) {
            setCode(msg.code!!);
        }
        if (msg.data != null) {
            setData(msg.data!!);
            // prevents second call of `set_data` later in FunC compiled code
            throw(0);
        }
    }

    /// Returns whether contract is upgradable
    /// Always returns true since this implementation is upgradable
    get fun isUpgradable(): Bool {
        return true;
    }

    /// Returns current contract version.
    get fun version(): Int {
        return self.version;
    }
}

asm fun setCode(code: Cell) { SETCODE }

asm fun setData(data: Cell) { c4 POP }

message Add {
    amount: Int as uint32;
}

contract SampleUpgradeContractV2 with Upgradable {
    version: Int as uint32 = 0;

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
