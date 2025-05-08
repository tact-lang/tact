fun mapTest() : Int {
    let m: map<Int, Int> = emptyMap();
    m.set(7, 70);
    return m.get(7)!!;
}

// Testing deepEquals on maps
fun mapDeepEqualsTest() : Bool {
    let m1: map<Int, Int> = emptyMap();
    let m2: map<Int, Int> = emptyMap();
    m1.set(1, 100);
    m2.set(1, 100);
    return m1.deepEquals(m2);
}

// Testing replace and replaceGet
fun mapReplaceTest() : Int {
    let m: map<Int, Int> = emptyMap();
    m.set(42, 200);
    let old: Int? = m.replaceGet(42, 300);
    return old!!; // should be 200
}

// Testing deletion via del and replace with null
fun mapDeletionTest() : Bool {
    let m: map<Int, Int> = emptyMap();
    m.set(5, 55);
    let deleted: Bool = m.del(5);
    let existsAfterDel: Bool = m.exists(5);
    // now test deletion using replace with null:
    m.set(6, 66);
    m.replace(6, null);
    let existsAfterReplace: Bool = m.exists(6);
    return deleted && (!existsAfterDel) && (!existsAfterReplace);
}
