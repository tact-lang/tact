struct MapHolder {
    m: map<Int, Int>;
}

contract TestMap {
    receive() {
         let holder: MapHolder = MapHolder { m: emptyMap() };
         holder.m.set(1, 42);
         holder.m.get(1);
    }
}
