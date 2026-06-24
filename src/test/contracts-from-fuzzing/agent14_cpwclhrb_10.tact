contract TestMapAddressBoolFixed {
    dict: map<Address, Bool> = emptyMap();

    receive() {
        // Obtain a valid Address from the message context
        let senderAddr: Address = context().sender;
        self.dict.set(senderAddr, true);
        let flag: Bool = self.dict.get(senderAddr)!!;
        dump(flag); // Expected output: true
    }
}
