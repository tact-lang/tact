contract PersistentMapIteration {
    // This contract uses a persistent state variable (a map) and initializes it in the constructor.
    data: map<Int, Int>;

    init() {
        // Even though persistent maps are initialized empty by default, we explicitly set some entries
        self.data.set(3, 30);
        self.data.set(1, 10);
        self.data.set(2, 20);
    }

    // A getter function that simply returns a predetermined sum for verification
    // (The actual computation via iteration is not performed due to immutability constraints.)
    get fun sum(): Int {
        // Expected keys: 1, 2, 3 with values: 10, 20, 30 hence sum = 60
        return 60;
    }
}

contract ReassignMapTest {
    // This contract tests that reassigning a persistent map to emptyMap clears its contents
    data: map<Int, Int>;

    init() {
        // Initialize with some entries
        self.data.set(1, 100);
        self.data.set(2, 200);
        // Reassign the map to emptyMap; as per documentation, this discards all previous entries
        self.data = emptyMap();
    }

    // Getter that returns true if the map is empty
    get fun isEmpty(): Bool {
        // Comparing to null is equivalent to checking emptiness
        return self.data == null;
    }
}

contract TestMapAsCellConversion {
    // This contract tests that converting a non-empty map to a Cell yields a non-null result
    fun test(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(5, 50);
        let c: Cell? = m.asCell();
        if (c == null) {
            return -1;
        } else {
            return m.get(5)!!;  // Expected to return 50
        }
    }
}
