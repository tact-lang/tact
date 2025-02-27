import "@stdlib/ownable";

/// Message for upgrading contract code and data.
message Upgrade {
    /// New code of the contract.
    /// Defaults to `null`, which keeps the previous code.
    code: Cell? = null;

    /// New data of the contract.
    /// Defaults to `null`, which keeps the previous data.
    data: Cell? = null;
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

            // By the end of every transaction,
            // Tact compiler automatically adds a call to setData() for your convenience.
            // However, we've already set the data ourselves,
            // so let's stop the execution now to prevent a secondary call to setData().
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
