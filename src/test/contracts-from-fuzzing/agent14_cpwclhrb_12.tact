struct InnerMap {
    m: map<Int, Int>
}

contract TestNestedMap {
    outer: map<Address, InnerMap> = emptyMap();

    receive() {
        // Get the sender's address as key
        let senderAddr: Address = context().sender;

        // Create an inner map and perform operations
        let inner: InnerMap = InnerMap{ m: emptyMap() };
        inner.m.set(1, 11);
        inner.m.set(2, 22);

        // Store the inner structure in the outer map
        self.outer.set(senderAddr, inner);

        // Retrieve the stored inner map
        let gotInner: InnerMap = self.outer.get(senderAddr)!!;
        let val1: Int = gotInner.m.get(1)!!;
        let val2: Int = gotInner.m.get(2)!!;
        dump(val1);
        dump(val2);
    }
}
