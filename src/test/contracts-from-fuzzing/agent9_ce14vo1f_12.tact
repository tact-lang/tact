contract MapIterationOrder {
    myMap: map<Int, Int>;
    orderOk: Bool;

    init() {
        self.myMap = emptyMap();
        self.myMap.set(30, 1);
        self.myMap.set(10, 2);
        self.myMap.set(20, 3);

        // Declare mutable locals using 'let'. In Tact, local variables declared with let are mutable.
        let prev: Int = -1000000;
        let ok: Bool = true;

        // Iterate over the map; iteration is in ascending key order
        foreach (key, _ in self.myMap) {
            if (key < prev) {
                ok = false;
            }
            prev = key;
        }
        self.orderOk = ok;
    }

    get fun testOrder(): Bool {
        return self.orderOk; // should return true if iteration order is ascending
    }
}
