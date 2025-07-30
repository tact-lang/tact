struct MyMapWrapper {
    m: map<Int, Int>
}

contract TestNestedMapWrapper {
    receive() {
        // Create an inner map of Int to Int
        let inner: map<Int, Int> = emptyMap();
        inner.set(1, 11);

        // Wrap the inner map in a struct
        let wrapper: MyMapWrapper = MyMapWrapper{ m: inner };

        // Create an outer map with key type Int and value type MyMapWrapper
        let outer: map<Int, MyMapWrapper> = emptyMap();
        outer.set(42, wrapper);

        // Retrieve the wrapper and test if inner map contains key 1
        let extracted: MyMapWrapper? = outer.get(42);
        if (extracted != null) {
            dump(extracted!!.m.exists(1)); // expected to dump true
        } else {
            dump(false);
        }
    }
}
