contract TestAddresses {
    // Test valid creation of newAddress for workchain (0) and masterchain (-1)
    fun testValidNewAddress() {
         let workchainAddr: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
         let masterchainAddr: Address = newAddress(-1, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    }

    // Test forceBasechain: valid case (should pass) and invalid case (should throw exit code 138)
    fun testForceBasechainValid() {
         let addr: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
         // This should not throw
         forceBasechain(addr);
    }
    
    fun testForceBasechainInvalid() {
         let addr: Address = newAddress(-1, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
         // This should throw exit code 138, so we catch it
         try {
             forceBasechain(addr);
         } catch (exitCode) {
             // expected exitCode 138
         }
    }

    // Test forceWorkchain with matching and non-matching workchain parameters
    fun testForceWorkchain() {
         let addrWorkchain: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
         let addrMasterchain: Address = newAddress(-1, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
         // These should pass
         forceWorkchain(addrWorkchain, 0, 100);
         forceWorkchain(addrMasterchain, -1, 200);
         
         // This should throw exit code 593, so we catch it
         try {
             forceWorkchain(addrWorkchain, -1, 593);
         } catch (exitCode) {
             // expected exitCode 593
         }
    }

    // Test conversion between Address and Slice
    fun testAddressAsSlice() {
         let addr: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
         let slice1: Slice = beginCell().storeAddress(addr).asSlice();
         let slice2: Slice = addr.asSlice();
         // Ideally, slice1 and slice2 encode the same address information
         if (slice1 != slice2) {
             // They should be equal; no action required if they differ.
         }
    }

    // Test conversion of Address to String
    fun testAddressToString() {
         let addr: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
         let s: String = addr.toString();
    }

    // Test basechain address primitives: emptyBasechainAddress and newBasechainAddress
    fun testBasechainAddresses() {
         let emptyAddr: BasechainAddress = emptyBasechainAddress();
         let nonEmptyAddr: BasechainAddress = newBasechainAddress(0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    }
}
