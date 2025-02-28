import "@stdlib/ownable";

/// Message for upgrading contract code and data with some timeout.
message Upgrade {
    /// New code of the contract.
    /// Defaults to `null`, which keeps the previous code.
    code: Cell? = null;

    /// New data of the contract.
    /// Defaults to `null`, which keeps the previous data.
    data: Cell? = null;

    /// Delay in seconds before upgrade can be confirmed.
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

    /// Timestamp in seconds of the last `Upgrade` message arrival.
    /// Used to enforce a timeout period before the confirmation.
    initiatedAt: Int;

    /// Contains new code, new data and a timeout period.
    upgradeInfo: Upgrade;

    /// Confirms and executes a pending upgrade only after `upgradeInfo.timeout`
    /// seconds have passed since the last `_initiatedAt`.
    receive(msg: Confirm) {
        require(now() >= self.initiatedAt + self.upgradeInfo.timeout, "DelayedUpgradable: Cannot confirm upgrade before timeout");

        if (self.upgradeInfo.code != null) {
            // Change of code will be applied at the end of this transaction
            setCode(self.upgradeInfo.code!!);
        }
        if (self.upgradeInfo.data != null) {
            // Change of data will be immediate
            setData(self.upgradeInfo.data!!);

            // By the end of every transaction,
            // Tact compiler automatically adds a call to setData() for your convenience.
            // However, we've already set the data ourselves,
            // so let's stop the execution now to prevent a secondary call to setData().
            throw(0);
        }
    }

    /// Instead of performing an upgrade right away,
    /// saves details for delayed execution.
    override inline fun upgrade(_: Context, msg: Upgrade) {
        self.upgradeInfo = msg;
        self.initiatedAt = now();
    }
}

/// Implements basic upgrade mechanism with owner validation.
trait Upgradable with Ownable {
    /// Contract owner address that can perform upgrades.
    owner: Address;

    /// Current contract version, auto-increments after each upgrade.
    /// Meant to be private and only accessible through the relevant getter.
    _version: Int as uint32;

    /// Checks the sender, performs an upgrade and increments the version.
    receive(msg: Upgrade) {
        let ctx = context();
        self.validateUpgrade(ctx, msg);
        self.upgrade(ctx, msg);

        self._version += 1;
    }

    /// Checks that the sender is the owner.
    /// Can be overridden.
    virtual inline fun validateUpgrade(_: Context, __: Upgrade) {
        self.requireOwner();
    }

    /// Sets the code if it's not `null`.
    /// Sets the data if it's not `null`.
    /// Can be overridden.
    virtual inline fun upgrade(_: Context, msg: Upgrade) {
        if (msg.code != null) {
            // Change of code will be applied at the end of this transaction
            setCode(msg.code!!);
        }
        if (msg.data != null) {
            // Change of data will be immediate
            setData(msg.data!!);

            // By the end of every transaction, Tact compiler automatically
            // adds a call to setData() for your convenience.
            // However, we've already set the data ourselves,
            // so let's stop the execution now to prevent a secondary setData().
            throw(0);
        }
    }

    /// A getter to check if the contract uses this trait.
    get fun isUpgradable(): Bool {
        return true;
    }

    /// A getter returning the current version of the contract.
    get fun version(): Int {
        return self._version;
    }
}

/// Change of code is be applied by the end of the current transaction.
asm fun setCode(code: Cell) { SETCODE }

/// Change of data is immediate.
asm fun setData(data: Cell) { c4 POP }
