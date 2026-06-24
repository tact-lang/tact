contract EmptyMapEquality {
    get fun test() : Bool {
         // Two empty maps should be equal (both are empty/null)
         let m1: map<Int, Int> = emptyMap();
         let m2: map<Int, Int> = emptyMap();
         return m1 == m2;
    }
}

contract StressMaps {
    get fun test() : Int {
         // Insert multiple entries into the map
         let m: map<Int, Int> = emptyMap();
         m.set(1, 10);
         m.set(2, 20);
         m.set(3, 30);
         m.set(4, 40);
         m.set(5, 50);
         
         // Sum the values: 10+20+30+40+50 = 150
         let s = m.get(1)!! + m.get(2)!! + m.get(3)!! + m.get(4)!! + m.get(5)!!;
         
         // Delete all inserted keys
         m.del(1);
         m.del(2);
         m.del(3);
         m.del(4);
         m.del(5);
         
         // Check that the map is empty
         let emptyCheck = m.isEmpty();
         
         // Return sum plus bonus if map is empty using ternary operator
         return s + (emptyCheck ? 1000 : 0);
    }
}
