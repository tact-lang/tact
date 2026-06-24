contract TestMapReplaceAndDel {
    get fun testReplace() : Int {
         let m: map<Int, Int> = emptyMap();
         m.set(5, 10);
         let old = m.replaceGet(5, 20)!!; // should return 10
         let res = m.get(5)!!; // should be 20 now
         let delSuccess = m.del(5);
         if (delSuccess && old == 10 && res == 20 && m.get(5) == null) { 
             return 1; 
         } else { 
             return 0; 
         }
    }
}
