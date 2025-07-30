struct Inner {
    vals: map<Int, Int>;
}

contract TestNestedMap {
    get fun test(): Int {
        let innerMap: map<Int, Int> = emptyMap();
        innerMap.set(2, 20);
        let outer: map<Int, Inner> = emptyMap();
        outer.set(1, Inner{ vals: innerMap });
        return outer.get(1)!!.vals.get(2)!!;
    }
}
