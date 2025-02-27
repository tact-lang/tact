import "@stdlib/ownable";

/// Message for upgrading contract code and data with some timeout.
message Upgrade {
    /// New code of the contract.
    /// Defaults to `null`, which keeps the previous code.
    code: Cell? = null;

    /// New data of the contract.
    /// Defaults to `null`, which keeps the previous data.
    data: Cell? = null;

    /// Delay in nanoseconds before upgrade can be confirmed.
    /// Defaults to zero, which means the upgrade can be confirmed immediately.
    /// Unused in `Upgradable` trait.
    timeout: Int = 0;
}

/// Message for confirming delayed upgrade execution.
/// Must be sent after the timeout specified in the `Upgrade` message has elapsed.
/// Can only be processed by contracts that implement the `DelayedUpgradable` trait.
message Confirm {}

/// Extended version of the `Upgradable` that adds a delay mechanism.
///
/// Upgrade process happens in two steps:
/// 1. Owner initiates an upgrade by sending the `Upgrade` message.
/// 2. After some timeout period owner confirms upgrade with the `Confirm` message.
trait DelayedUpgradable with Upgradable {
    /// Contract owner address that can perform upgrades.
    owner: Address;

    /// Current contract version, auto-increments after each upgrade.
    /// Meant to be private and only accessible through the relevant getter.
    _version: Int as uint32;

    /// Timestamp that is used to enforce a timeout period
    /// before the confirmation.
    initiatedAt: Int;

    /// Contains new code, new data and a timeout period.
    upgradeInfo: Upgrade;

    /// Confirms and executes pending upgrade after timeout period.
    /// Can only be called after `upgradeInfo.timeout` nanoseconds have passed.
    receive(msg: Confirm) {
        require(now() > self.initiatedAt + self.upgradeInfo.timeout, "DelayedUpgradable: Cannot confirm upgrade before timeout");

        if (self.upgradeInfo.code != null) {
            setCode(self.upgradeInfo.code!!);
        }
        if (self.upgradeInfo.data != null) {
            setData(self.upgradeInfo.data!!);
            throw(0);
        }
    }

    /// Instead of performing an upgrade right away,
    /// saves details for delayed execution.
    override inline fun upgrade(_: Context, msg: Upgrade) {
        self.upgradeInfo = msg;
    }
}

//
// Helper traits described earlier on this page
//

trait Upgradable with Ownable {
    owner: Address;

    /// Meant to be private and only accessible through the relevant getter.
    _version: Int as uint32;

    receive(msg: Upgrade) {
        let ctx = context();
        self.validateUpgrade(ctx, msg);
        self.upgrade(ctx, msg);

        self._version += 1;
    }

    virtual inline fun validateUpgrade(ctx: Context, _: Upgrade) {
        self.requireOwner();
    }

    virtual inline fun upgrade(_: Context, msg: Upgrade) {
        if (msg.code != null) {
            // Change of code will be applied by the end of this transaction
            setCode(msg.code!!);
        }
        if (msg.data != null) {
            // Change of data will be immediate
            setData(msg.data!!);

            // To prevent further duplicate calls
            throw(0);
        }
    }

    get fun isUpgradable(): Bool {
        return true;
    }

    get fun version(): Int {
        return self._version;
    }
}

asm fun setCode(code: Cell) { SETCODE }

asm fun setData(data: Cell) { c4 POP }
