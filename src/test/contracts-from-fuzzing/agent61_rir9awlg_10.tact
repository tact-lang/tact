struct MapHolder {
    m: map<Int, Int>;
    n: Int;
}

contract TestMapStruct {
    receive() {
        let mh: MapHolder = MapHolder { m: emptyMap(), n: 7 };
        mh.m.set(10, 20);
        let v: Int = mh.m.get(10)!!;
    }
}
