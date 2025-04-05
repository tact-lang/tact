struct WithMapStruct {
    m: map<Int, Int>;
}

fun create_map() : WithMapStruct {
    let mp: map<Int, Int> = emptyMap();
    mp.set(1, 100);
    mp.set(2, 200);
    return WithMapStruct { m: mp };
}

contract TestWithMapInStruct {
    receive() {
        let data = create_map();
        dump(data.m.get(1)!!);
    }
}
