struct Inner {
    m: map<Int, Int>;
}

contract TestNestedMap {
    receive() {
        // Create an instance of the struct with a nested map
        let inner: Inner = Inner { m: emptyMap() };
        // Set and then get a value from the nested map
        inner.m.set(1, 100);
        let val: Int? = inner.m.get(1);
        dump(val); // Expected output: Some(100)
    }
}
