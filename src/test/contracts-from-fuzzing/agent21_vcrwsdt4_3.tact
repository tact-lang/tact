contract FuzzTestAddresses {
    // Test valid newAddress with chain 0 and -1, ensuring no issues with these chain ids
    get fun testValidNewAddress0(): Bool {
        let addr0: Address = newAddress(0, 0x1111111111111111);
        let addrMaster: Address = newAddress(-1, 0x2222222222222222);
        return addr0.toString() != addrMaster.toString();
    }

    // Test that invalid chain id (other than 0 or -1) fails at compile time
    // Uncommenting the function below should cause a compile-time error as documented
    // get fun testInvalidChain(): Address {
    //     return newAddress(2, 0x3333333333333333);
    // }

    // Test contractAddress and contractAddressExt in a deployed contract scenario
    get fun testContractAddressEquivalence(): Bool {
        let s: StateInit = initOf FuzzTestAddresses();
        let addr1: Address = contractAddress(s);
        let addr2: Address = contractAddressExt(0, s.code, s.data);
        return addr1.toString() == addr2.toString();
    }

    // Test Address.asSlice consistency by comparing against storing address in a cell
    get fun testAsSliceConsistency(): Bool {
        let a: Address = newAddress(0, 0x4444444444444444);
        let slice1: Slice = a.asSlice();
        let slice2: Slice = beginCell().storeAddress(a).asSlice();
        return slice1 == slice2;
    }

    // Test Address.toString returns non-empty string representation
    get fun testToStringNotEmpty(): Bool {
        let a: Address = newAddress(0, 0x5555555555555555);
        let str: String = a.toString();
        return str != "";
    }

    // Test BasechainAddress consistency using emptyBasechainAddress and newBasechainAddress
    get fun testBasechainAddressFunctions(): Bool {
        let emptyAddr: BasechainAddress = emptyBasechainAddress();
        let newAddr: BasechainAddress = newBasechainAddress(0xabcdef);
        // Also use newBasechainAddress with a negative value to see if it preserves sign (as Int is signed)
        let negAddr: BasechainAddress = newBasechainAddress(-42);
        return emptyAddr.hash == null && newAddr.hash == 0xabcdef && negAddr.hash == -42;
    }

    // Test hasSameBasechainAddress extension: compare the sender with computed contract address
    get fun testHasSameBasechain(): Bool {
        let s: StateInit = initOf FuzzTestAddresses();
        let addr: Address = contractAddress(s);
        // According to docs_ref_core-addresses.md, hasSameBasechainAddress works for basechain addresses
        return s.hasSameBasechainAddress(addr);
    }

    // Test equality behavior of Address via toString comparison
    get fun testAddressEquality(): Bool {
        let addr1: Address = newAddress(0, 0x6666666666666666);
        let addr2: Address = newAddress(0, 0x6666666666666666);
        return addr1.toString() == addr2.toString();
    }
}

// Standalone functions to test behavior outside of a contract context

fun testMixedAddresses(): Bool {
    // Addresses with same hash but different workchain ids should differ
    let a1: Address = newAddress(0, 0x7777777777777777);
    let a2: Address = newAddress(-1, 0x7777777777777777);
    return a1.toString() != a2.toString();
}
