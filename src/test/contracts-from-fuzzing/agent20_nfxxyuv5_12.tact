struct Inner {
    m: map<Int, Int>;
}

contract TestNestedMapStruct {
    receive() {
        // Create an inner map of Int to Int inside a struct
        let inner: Inner = Inner { m: emptyMap() };
        inner.m.set(1, 111);

        // Create an outer map that maps Int keys to Inner structs
        let outer: map<Int, Inner> = emptyMap();
        outer.set(10, inner);

        // Retrieve the Inner struct from the outer map
        let maybeInner: Inner? = outer.get(10);
        let retrievedInner: Inner = maybeInner!!; // assert non-null

        // Retrieve the value associated with key 1 from the inner map
        let innerValue: Int? = retrievedInner.m.get(1);
        dump(innerValue); // Expected output: 111
    }
}
