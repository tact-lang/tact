struct BalanceDetails {
    total: Int as coins;
    locked: Int as uint32;
    unlocked: Int as int64;
}

contract TestContract {
    balance: BalanceDetails;
    init() {
        self.balance = BalanceDetails{
            total: 1000000000,
            locked: 1000,
            unlocked: 500
        };
    }
}