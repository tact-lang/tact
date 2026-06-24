struct MyStruct {
    inner: map<Int, Int>
}

contract Test {
    receive() {
        // Testing nested map structures:
        // 1. Create a struct with an internal map field
        let s: MyStruct = MyStruct { inner: emptyMap() };
        s.inner.set(2, 99);
        dump(s.inner.get(2)!!); // Expected to dump 99
        
        // 2. Create a map with Address keys and MyStruct values
        let m: map<Address, MyStruct> = emptyMap();
        // Use the sender's address as the key
        let addr: Address = context().sender;
        m.set(addr, s);
        dump(m.exists(addr)); // Expected to dump true
    }
}
