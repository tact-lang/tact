contract TestMapReplaceGet {
    m: map<Int, Int>;

    init() {
         self.m = emptyMap();
         self.m.set(7, 70);
         self.m.set(42, 42);
         // Replace existing key
         let oldVal1: Int? = self.m.replaceGet(7, 68); // should yield 70
         // Attempt to replace a non-existent key
         let oldVal2: Int? = self.m.replaceGet(8, 80); // should yield null
         // Replace with null to delete
         let oldVal3: Int? = self.m.replaceGet(42, null); // should yield 42
    }

    receive() {
         let v1: Int? = self.m.get(7); // expected: 68
         let v2: Int? = self.m.get(42); // expected: null
    }
}
