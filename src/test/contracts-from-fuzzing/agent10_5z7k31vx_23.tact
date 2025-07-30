struct MapHolder { m: map<Int, Int> }

fun testMapHolder() : Int {
    let holder: MapHolder = MapHolder { m: emptyMap() };
    // Directly mutate the map in holder
    holder.m.set(1, 10);
    holder.m.set(2, 20);
    holder.m.replace(1, 15);
    let v: Int? = holder.m.get(1);
    if (v != null) { return v!!; } else { return 0; }
}

fun main() : Int {
    return testMapHolder();
}
