fun basicMapTest(): Int {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 10);
    m.set(2, 20);
    let v1 = m.get(1)!!;
    let v2 = m.get(2)!!;
    let replaced = m.replace(1, 15);  // should return true
    let v1_new = m.get(1)!!;
    // Remove key 2 by setting its value to null:
    m.set(2, null);
    let exists2 = m.exists(2);
    // Sum values: expect 10 + 15 + (exists2?100:0); with key 2 removed exists2==false.
    return v1 + v1_new + (exists2 ? 100 : 0);
}
