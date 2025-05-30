struct HasBig {
    bigInt: Int as uint256;
}

contract Test {
    val: HasBig;
    init() {
        self.val = HasBig{ bigInt: 42 };
    }
    receive() { let _=self.val.bigInt; }
}