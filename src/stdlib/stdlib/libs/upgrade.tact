/// Message for upgrading contract code and data.
message Upgrade {
    /// Optional new contract code as Cell.
    code: Cell? = null;
    /// Optional new contract data as Cell.
    data: Cell? = null;
    /// Delay in nanoseconds before upgrade can be confirmed.
    /// Zero means upgrade can be confirmed immediately.
    /// Used only for `DelayedUpgradable`.
    timeout: Int = 0;
}

/// Message to confirm delayed upgrade execution.
/// Must be sent after timeout period specified in `Upgrade` message has passed.
/// Can only be processed by contracts implementing `DelayedUpgradable` trait.
message Confirm {}

/// Trait that enables contract upgradeability.
/// Implements basic upgrade mechanism with owner validation.
trait Upgradable {
    /// Contract owner address that can perform upgrades.
    owner: Address;
    
    /// Current contract version, increments after each upgrade.
    version: Int;

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
        require(ctx.sender == self.owner, "Upgradable: Sender is not a contract owner");
    }

    /// Performs the actual upgrade.
    /// Updates contract code and optionally data.
    virtual inline fun upgrade(_: Context, msg: Upgrade) {
        if (msg.code != null) {
            setCode(msg.code!!);
        }
        if (msg.data != null) {
            setData(msg.data!!);
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

/// Extended version of Upgradable that adds a delay mechanism.
/// Upgrade process happens in two steps:
/// 1. Owner initiates upgrade by sending `Upgrade` message.
/// 2. After timeout period, owner confirms upgrade with `Confirm` message.
trait DelayedUpgradable with Upgradable {
    /// Contract owner address that can perform upgrades.
    owner: Address;
    
    /// Current contract version, increments after each upgrade.
    version: Int;

    /// Timestamp when upgrade was initiated.
    /// Used to enforce timeout period before confirmation.
    initiated_at: Int;

    /// Stores information about pending upgrade.
    /// Contains new code, optional data and timeout period.
    upgrade_info: Upgrade;

    /// Confirms and executes pending upgrade after timeout period.
    /// Can only be called after `upgrade_info.timeout` nanoseconds have passed.
    receive(msg: Confirm) {
        require(now() > self.initiated_at + self.upgrade_info.timeout, "DelayedUpgradable: Cannot confirm upgrade before timeout");

        if (self.upgrade_info.code != null) {
            setCode(self.upgrade_info.code!!);
        }
        if (self.upgrade_info.data != null) {
            setData(self.upgrade_info.data!!);
        }
    }

    /// Stores upgrade information for later confirmation.
    /// Instead of performing upgrade immediately, saves details for delayed execution.
    override inline fun upgrade(_: Context, msg: Upgrade) {
        self.upgrade_info = msg;
    }
}

@name(set_code)
native setCode(code: Cell);

@name(set_data)
native setData(d: Cell);
