contract MapValidTest {
    // A map with allowed key type Int and value type Int, initialized to emptyMap()
    m: map<Int, Int> = emptyMap();

    // Constructor to initialize the map
    init() {
        self.m.set(1, 42);
    }

    // A getter function to retrieve values
    get fun getValue(key: Int) : Int {
        // Using !! since we expect the key to exist
        return self.m.get(key)!!;
    }
}
