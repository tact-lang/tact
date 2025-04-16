contract MapEqualityTest {
    m1: map<Int, Int> = emptyMap();
    m2: map<Int, Int> = emptyMap();

    init() {
         // Inserting keys into m1
         self.m1.set(1, 100);
         self.m1.set(2, 200);

         // Inserting keys into m2 in reverse order
         self.m2.set(2, 200);
         self.m2.set(1, 100);
    }

    // This getter uses deepEquals which should return true as content matches
    get fun testDeepEquals() : Bool {
         return self.m1.deepEquals(self.m2);
    }

    // This getter uses shallow equality (==) which compares serialization; it may return false if serialization order differs
    get fun testShallowEquals() : Bool {
         return (self.m1 == self.m2);
    }
}
