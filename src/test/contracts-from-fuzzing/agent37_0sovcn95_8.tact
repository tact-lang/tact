struct MapContainer {
    m: map<Int, Int>
}

struct NestedMap {
    mc: MapContainer;
    x: Int
}

contract TestMapNested {
    receive() {
        let nm: NestedMap = NestedMap {
            mc: MapContainer { m: emptyMap() },
            x: 123
        };
        nm.mc.m;
    }
}
