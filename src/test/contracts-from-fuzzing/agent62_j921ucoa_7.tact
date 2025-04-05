struct MapHolder {
    entries: map<Int, Int>;
}

contract TestMapInStruct {
    receive() {
        let m = MapHolder { entries: emptyMap() };
        m.entries.set(1, 100);
        m.entries.get(1)!!;
    }
}
