contract Test {
    receive() {
        // Test map with Address as key and Int as value using correct angle bracket syntax
        let addrMap: map<Address, Int> = emptyMap();
        addrMap.set(myAddress(), 123);
        let value: Int = addrMap.get(myAddress())!!;
        dump(value); // Expected output: 123
    }
}
