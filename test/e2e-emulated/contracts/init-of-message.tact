message InitData {
    seller: Address;
    nonce: Int as uint64;
}

contract Test {
    seller: Address;

    init(i: InitData) {
        self.seller = i.seller;
    }

    receive() {
        // deploy
    } 
}

