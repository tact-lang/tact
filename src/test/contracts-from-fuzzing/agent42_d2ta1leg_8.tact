struct Inner {
    data: Int;
}

struct Outer {
    innerMap: map<Int, Inner>;
}

contract Test {
    receive() {
        // Test 9: Nested map structure with a struct value containing a map
        let innerMap: map<Int, Inner> = emptyMap();
        let inner: Inner = Inner{ data: 123 };
        innerMap.set(5, inner);

        let outer: Outer = Outer{ innerMap: innerMap };
        let fetched: Inner? = outer.innerMap.get(5); // Expected to retrieve 'inner'
    }
}
