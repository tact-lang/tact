struct Inner {
    x: Int;
    y: Int;
}

struct MapNested {
    entries: map<Int, Inner>;
}

contract TestMapNested {
    receive() {
        let m = MapNested { entries: emptyMap() };
        m.entries.set(1, Inner { x: 42, y: 84 });
        m.entries.get(1)!!.x;
    }
}
