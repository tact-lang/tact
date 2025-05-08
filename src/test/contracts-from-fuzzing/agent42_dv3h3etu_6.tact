contract TestAddressEquality {
    receive() {
        // Create two addresses with basechain id 0 and a zero hash
        let addr1: Address = newAddress(0, 0);
        let addr2: Address = newAddress(0, 0);
        require(addr1 == addr2, "Zero addresses not equal");

        // Create an address on masterchain (-1) with a zero hash
        let addr3: Address = newAddress(-1, 0);
        require(addr1 != addr3, "Different workchain addresses considered equal");

        // Use a dynamic chain value (which is constant 0 at runtime) to test dynamic evaluation
        let dynChain: Int = 0;
        let addr4: Address = newAddress(dynChain, 0);
        require(addr1 == addr4, "Dynamic chain usage failed equality");
    }
}
