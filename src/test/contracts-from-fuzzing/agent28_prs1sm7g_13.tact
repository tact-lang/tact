contract TestAddressesComprehensive {
    // Test 1: Create a dynamic address using a runtime-supplied chain id.
    // If the chain id is valid (even if not a constant), it should compile and use the provided value internally.
    fun dynamicAddress(chain: Int): Address {
        return newAddress(chain, 0xABCDEF1234567890);
    }

    // Test 2: Store an address in a cell and then retrieve it using asAddress with the provided chain id.
    fun storeAndRetrieve(addr: Address, chain: Int): Bool {
        let cell: Cell = beginCell().storeAddress(addr).endCell();
        let ret: Address = cell.asSlice().asAddress(chain);
        return ret == addr;
    }

    // Test 3: Test forceBasechain dynamically.
    // Returns true if the address is on basechain (chain == 0) and forceBasechain passes; false otherwise.
    fun testForceBasechainDynamic(chain: Int): Bool {
        try {
            let addr: Address = newAddress(chain, 0xABCDEF1234567890);
            forceBasechain(addr);
            return true;
        } catch (exitCode) {
            return false;
        }
    }

    // Test 4: Test that the contractHash and contractAddress are consistent.
    fun testContractHashEquiv(): Bool {
        let s: StateInit = initOf TestAddressesComprehensive();
        let h: Int = contractHash(s.code, s.data);
        let addr1: Address = newAddress(0, h);
        let addr2: Address = contractAddress(s);
        return addr1 == addr2;
    }

    // Test 5: Test converting an address (obtained via a compile-time literal) to a string,
    // storing in a cell, then converting back to an address using asAddress.
    fun testAddressStringAndCell(): Bool {
        let a: Address = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
        let cell: Cell = beginCell().storeAddress(a).endCell();
        let s: Slice = cell.asSlice();
        let a2: Address = s.asAddress(0);
        return a == a2 && a.toString() != "";
    }
}
