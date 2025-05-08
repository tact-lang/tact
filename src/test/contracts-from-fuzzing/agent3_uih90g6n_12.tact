contract TestReplace {
    m: map<Int, Int> = emptyMap();

    receive() {
         // Set initial entries
         self.m.set(7, 70);
         
         // Test replace: key exists
         let r1: Bool = self.m.replace(7, 68);
         dump(r1); // expecting true
         
         // Test replaceGet: key exists
         let oldVal: Int? = self.m.replaceGet(7, 100);
         dump(oldVal); // expecting 68
         
         // Test replace on non-existing key
         let r2: Bool = self.m.replace(8, 50);
         dump(r2); // expecting false
         
         // Test replaceGet on non-existing key
         let oldVal2: Int? = self.m.replaceGet(8, 50);
         dump(oldVal2); // expecting null
    }
}
