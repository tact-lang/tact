struct MyNestedMap {
    inner: map<Int, Int> = emptyMap();
}

contract TestNestedMapStruct {
    m: map<Int, MyNestedMap> = emptyMap();

    receive() {
         let nm = MyNestedMap { inner: emptyMap() };
         nm.inner.set(99, 888);
         self.m.set(1, nm);
         let retrieved = self.m.get(1)!!;
         let value = retrieved.inner.get(99);
    }
}
