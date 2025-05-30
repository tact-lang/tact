contract TestMapReplace {
    m: map<Int, Int>;

    init() {
         self.m = emptyMap();
         self.m.set(7, 70);
         // Replace existing entry: should return true
         let rep1: Bool = self.m.replace(7, 68);
         // Attempt to replace non-existing key: should return false
         let rep2: Bool = self.m.replace(8, 80);
    }

    receive() {
         // Expected value for key 7 is now 68
         let v: Int? = self.m.get(7);
    }
}
