struct Inner {
    data: map<Int, Int>;
}

contract TestNestedMap {
    receive() {
        // Test nested map structures: map<Address, Inner> with inner map of type map<Int, Int>
        let inner: map<Int, Int> = emptyMap();
        inner.set(2, 200);

        let ins: Inner = Inner{ data: inner };
        let outer: map<Address, Inner> = emptyMap();
        outer.set(myAddress(), ins);

        let retrieved: Inner? = outer.get(myAddress());
        dump(retrieved!!.data.get(2)); // expecting dump(200)
    }
}
