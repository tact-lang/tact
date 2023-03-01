message TestMessage {
    to: Int;
    address: Address;
}

contract MasterchainTester {

    init() {
        
    }
    
    receive("Deploy") {
        // Deploy
    }

    receive(message: TestMessage) {
        // Should fail for non-masterchain
    }

    get fun createAddress(chain: Int, hash: Int): Address {
        return newAddress(chain, hash);
    }

    get fun parseAddress(src: Slice): Address {
        return src.loadAddress();
    }
}