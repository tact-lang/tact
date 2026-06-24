contract TestContract(
    count: Int,
    flag: Bool,
    note: String?,
    addr: Address,
    amount: Int as coins,
    big: Int as uint128,
    maybe: Bool?
) {
    receive() {
        // do nothing, just to use the contract param persistent vars
        let _ = self.count + self.amount + self.big;
    }
}