contract TestMultipleOperations {
    // This contract chains a series of map operations:
    // 1. Insert multiple keys
    // 2. Replace a value
    // 3. Delete one key via replaceGet with null
    // 4. Combine results from get() and the returned old values
    fun test(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(10, 100);
        m.set(20, 200);
        m.set(30, 300);
        let oldVal: Int? = m.replaceGet(20, 250); // replace 200 with 250
        let delVal: Int? = m.replaceGet(10, null); // delete key 10, old value should be 100
        // Now, m contains key 20 with value 250 and key 30 with value 300
        // We'll compute: (250 + 300) + (oldVal - delVal) = 550 + (200 - 100) = 550 + 100 = 650
        return (m.get(20)!! + m.get(30)!!) + (oldVal!! - delVal!!);
    }
}
