struct MapHolder {
    values: map<Int, Int>;
}

struct NestedMap {
    inner: MapHolder;
    extra: Int as uint8;
}

contract TestNestedMap {
    receive() {
        let myMap: map<Int, Int> = emptyMap();
        myMap.set(1, 100);
        myMap.set(2, 200);
        let x = NestedMap {
            inner: MapHolder { values: myMap },
            extra: 50
        };
        // Using .get() to fetch a value; !! asserts non-null
        dump(x.inner.values.get(2)!! + x.extra);
    }
}
