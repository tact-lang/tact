struct MapStruct {
    Opt: Int?;
    Dict: map<Int, Int>;
}

contract TestMapStruct {
    receive() {
        let s = MapStruct { Opt: 42, Dict: emptyMap() };
        if (s.Opt != null) {
            s.Dict.set(1, s.Opt);
        }
        return;
    }
}
