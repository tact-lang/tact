struct Nested {
    inner: map<Address, Int>;
}

contract TestNestedMap {
    // Test nested maps: outer is map<Address, Nested> and inner map is map<Address, Int>
    get fun f() : Int {
       let outer: map<Address, Nested> = emptyMap();
       let innerMap: map<Address, Int> = emptyMap();
       innerMap.set(myAddress(), 123);
       let nest = Nested { inner: innerMap };
       outer.set(myAddress(), nest);
       return outer.get(myAddress())!!.inner.get(myAddress())!!;
    }
}
