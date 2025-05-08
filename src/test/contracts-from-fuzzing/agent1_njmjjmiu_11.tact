struct Inner {
    a: Int;
}

struct Outer {
    inner: map<Int, Inner>;
}

contract NestedMapTest {
    receive() {
        // Test nested map: Outer contains a map of Inner structures
        let innerMap: map<Int, Inner> = emptyMap();
        innerMap.set(1, Inner{ a: 42 });
        
        let out: Outer = Outer{ inner: innerMap };
        let m: map<Int, Outer> = emptyMap();
        m.set(10, out);
        
        let fetchedOuter: Outer = m.get(10)!!;
        let value: Int = fetchedOuter.inner.get(1)!!.a;
        dump(value); // Expected output: 42
    }
}
