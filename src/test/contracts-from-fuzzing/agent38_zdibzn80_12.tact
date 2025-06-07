struct Nested {
    inner: map<Int, Int>;
}

contract Test_nestedMap {
    receive() {
         let m: map<Int, Int> = emptyMap();
         m.set(1, 10);
         m.set(2, 20);
         let n: Nested = Nested { inner: m };
         dump(n.inner.get(2)!!); // Expected output: 20
    }
}
