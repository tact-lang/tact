contract TestMapOps {
    // Persistent state variable: map from Int to Int
    m: map<Int, Int> = emptyMap();

    init() {
        // Insert key-value, test get, exists, replace, deletion
        self.m.set(1, 42);
        let _exists: Bool = self.m.exists(1);
        let _val: Int = self.m.get(1)!!;

        // Replace value for existing key, then delete using replace with null
        let _replaced: Bool = self.m.replace(1, 100);
        let _deleted: Bool = self.m.replace(1, null);

        // Insert new key and delete it using del()
        self.m.set(2, 200);
        let _delOk: Bool = self.m.del(2);

        // Reinitialize map and insert a new value
        self.m = emptyMap();
        self.m.set(3, 300);
    }

    get fun getVal(k: Int): Int? {
        return self.m.get(k);
    }
}
