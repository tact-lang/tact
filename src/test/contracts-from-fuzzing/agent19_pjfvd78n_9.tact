contract TestMapIsEmpty {
    m: map<Int, Int>;

    init() {
         self.m = emptyMap();
         // Initially, the map is empty
         let initiallyEmpty: Bool = self.m.isEmpty();
         // Now add an entry
         self.m.set(5, 50);
    }

    receive() {
         // After insertion, the map should not be empty
         let stillEmpty: Bool = self.m.isEmpty();
    }
}
