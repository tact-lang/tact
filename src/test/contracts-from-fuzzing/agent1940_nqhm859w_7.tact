struct Inner {
    bigNumber: Int as uint256;
    flag: Bool;
}

contract SerializationEdge {
    storage: Inner;

    init() {
        self.storage = Inner{
            bigNumber: 340282366920938463463374607431768211455, // max uint128
            flag: true
        };
    }
}