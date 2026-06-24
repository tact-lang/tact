contract TestAddrMap {
    receive() {
        // Create a map with Address keys and Bool values
        let m: map<Address, Bool> = emptyMap();
        
        // Use the sender address from the message context as a key
        let senderAddr: Address = context().sender;
        m.set(senderAddr, true);
        
        // Check that the key exists in the map
        if (m.exists(senderAddr)) {
            dump(1);  // expected output: 1
        } else {
            dump(0);
        }
    }
}
