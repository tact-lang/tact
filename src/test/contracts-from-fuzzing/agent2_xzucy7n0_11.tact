contract TestDeepEquals {
  fun test(): Int {
    let map1: map<Int, Int> = emptyMap();
    let map2: map<Int, Int> = emptyMap();
    
    // Set identical keys and values in both maps
    map1.set(10, 20);
    map1.set(30, 40);

    map2.set(10, 20);
    map2.set(30, 40);

    // Using deepEquals should return true
    if (!map1.deepEquals(map2)) { return -1; }

    // Shallow comparison (==) should also return true in this case
    if (map1 != map2) { return -2; }

    return 42;
  }
}
