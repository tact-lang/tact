struct InnerMap {
    map_field: map<Int,Int>;
}

struct OuterMap {
    inner: InnerMap;
}

contract TestContract {
    receive() {
        let x = OuterMap{ inner: InnerMap{ map_field: emptyMap() } };
        x.inner.map_field;
    }
}
