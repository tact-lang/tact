struct Info {
    owner: Address;
    minter: Address;
}

contract ExampleTernaryWithStructConstruction(
    owner: Address,
    minter: Address,
) {
    receive() {
        let foo = true ? Info {
            owner: self.owner,
            minter: self.minter,
        } : null;
        if (foo != null) {
            dump(foo!!.owner);
            dump(foo!!.minter);
        }
    }
}
