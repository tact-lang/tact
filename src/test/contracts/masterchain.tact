message TestMessage {
    address: Address;
    address2: Address?;
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

    get fun serializeAddress(src: Address): Bool {
        return true; // NOTE: src is unused but still have to be checked
    }

    get fun handleStruct(src: TestMessage): Bool {
        return true; // NOTE: src is unused but still have to be checked
    }
}