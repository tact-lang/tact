contract TestStoreLoadAddress {
    // Test storing an address in a Builder and loading it back using loadAddress
    receive() {
        let addr = newAddress(0, 0xabcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789);
        let builder = beginCell().storeAddress(addr);
        let s = builder.asSlice();
        let addr2 = s.loadAddress();
        require(addr == addr2, "SLA");
    }
}

contract TestContractHash {
    // Test that contractHash together with newAddress equals contractAddress
    init() {}
    get fun testHash(): Bool {
         let s: StateInit = initOf TestContractHash();
         let h = contractHash(s.code, s.data);
         let addr1 = newAddress(0, h);
         let addr2 = contractAddress(s);
         return addr1 == addr2;
    }
}

contract TestOptionalAddress {
    // Test that an optional Address value is non-null when obtained via myAddress()
    init() {}
    get fun testOptional(): Bool {
         let opt: Address? = myAddress();
         // The non-null assertion should pass
         return opt!! == myAddress();
    }
}

contract TestAddressRoundtrip {
    // Test roundtrip conversion: Address -> Slice -> parseStdAddress -> newAddress
    receive() {
         let addr = newAddress(0, 0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef);
         let s1 = addr.asSlice();
         let stdAddr = parseStdAddress(s1);
         let addr2 = newAddress(stdAddr.workchain, stdAddr.address);
         require(addr == addr2, "Roundtrip");
    }
}
