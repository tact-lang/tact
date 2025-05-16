contract CompareAddresses {
    // This function compares two addresses for equality
    get fun areEqual(addr1: Address, addr2: Address): Bool {
         return addr1 == addr2;
    }
}
