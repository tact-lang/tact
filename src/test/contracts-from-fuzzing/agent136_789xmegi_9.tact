////////// Test 11: Using contractHash with initOf
contract HashTest {
    init(a: Int) {}
    receive() {
         let s = initOf HashTest(55);
         let h = contractHash(s.code, s.data);
         // h is the hash computed from the init package
    }
}

////////// Test 12: Using contractAddress and contractAddressExt with initOf
contract AddressTest {
    init() {}
    receive() {
         let s = initOf AddressTest();
         let a = contractAddress(s);
         let a2 = contractAddressExt(0, s.code, s.data);
         let eq = (a == a2);
    }
}

////////// Test 13: Redundant self usage, comparing myCode() with codeOf
contract SelfCodeConsistency {
    init() {}
    receive() {
         let c1 = myCode();
         let c2 = codeOf SelfCodeConsistency;
         let eq = (c1 == c2);
    }
}
