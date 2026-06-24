struct Inner {
    m: map<Int, Int>;
}

contract TestNested {
    // Persistent map mapping Address to Inner structures
    f: map<Address, Inner>;

    receive() {
        self.f = emptyMap();
        // Initialize an Inner struct with an empty map
        let inner: Inner = Inner { m: emptyMap() };
        // Set a key-value pair in the inner map
        inner.m.set(3, 300);
        // Associate the sender's address with the inner struct using sender()
        self.f.set(sender(), inner);

        // Retrieve the inner map using the sender's address
        let retrieved: Inner? = self.f.get(sender());
        if (retrieved != null) {
            let val: Int? = retrieved!!.m.get(3);
            if (val != null) {
                dump(val); // expected output: 300
            } else {
                dump(0);
            }
        } else {
            dump(0);
        }
    }
}
