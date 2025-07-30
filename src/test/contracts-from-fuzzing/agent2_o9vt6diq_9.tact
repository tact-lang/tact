contract TestAddressLiteral {
    // Test constructing an Address from a compile-time constant string literal
    receive() {
        let a = address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2");
        let s = a.toString();
        require(s == "EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2", "AddrLiteral");
    }
}

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

contract TestParseVarAddressCustom {
    // Test parseVarAddress with a custom bit-length for the address field
    receive() {
        // Construct a variable length address with custom length = 123 bits
        let originalValue = 345; // arbitrary 123-bit number
        let workchain = 234; 
        // Build a cell with a VarAddress encoding
        let builder = beginCell()
            .storeUint(6, 3)     // flag to recognize VarAddress
            .storeUint(123, 9)   // bit-length of the address field
            .storeUint(workchain, 32)  // workchain, stored as 32 bits
            .storeUint(originalValue, 123); // the address field of specified bit-length
        let slice = builder.asSlice();
        let varAddr = parseVarAddress(slice);
        let loadedValue = varAddr.address.loadUint(123);
        require(loadedValue == originalValue, "VarCustom");
    }
}

contract TestMaxHash {
    // Test constructing an address with the maximum 256-bit hash (2^256 - 1)
    receive() {
        let maxHash = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
        let addr = newAddress(0, maxHash);
        let s = addr.asSlice();
        let stdAddr = parseStdAddress(s);
        let addr2 = newAddress(stdAddr.workchain, stdAddr.address);
        require(addr == addr2, "MaxHash");
    }
}
