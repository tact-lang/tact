contract AdvancedMapOps {
    myMap: map<Int, Int>;

    init() {
        // Initialize the map
        self.myMap = emptyMap();

        // Test: Insertion
        self.myMap.set(1, 100);
        self.myMap.set(2, 200);
        self.myMap.set(3, 300);

        // Test: get
        let v2: Int = self.myMap.get(2)!!; // should be 200

        // Test: replace and replaceGet
        let replaced: Bool = self.myMap.replace(2, 250); // replace key 2 with 250, expecting true
        let old2: Int? = self.myMap.replaceGet(2, 300);  // replace key 2 again; old value should be 250

        // Test: deletion by replacing with null
        let deletion: Bool = self.myMap.replace(1, null); // key 1 is deleted

        // Test: exists and isEmpty
        let exists1: Bool = self.myMap.exists(1); // false, since key 1 was deleted
        let isEmptyBefore: Bool = self.myMap.isEmpty(); // false, as keys 2 and 3 remain

        // Test: asCell on maps
        let cellNonEmpty: Cell? = self.myMap.asCell();
        let mEmpty: map<Int, Int> = emptyMap();
        let cellEmpty: Cell? = mEmpty.asCell();

        // Test: iteration (allowed since self.myMap is a path expression)
        foreach (k, v in self.myMap) {
            dump(v);
        }

        // Dump additional values for runtime verification
        dump(v2);
        dump(replaced);
        dump(old2);
        dump(exists1);
        dump(isEmptyBefore);
        dump(cellNonEmpty);
        dump(cellEmpty);
    }

    get fun test(): Int {
        return 42;
    }
}
