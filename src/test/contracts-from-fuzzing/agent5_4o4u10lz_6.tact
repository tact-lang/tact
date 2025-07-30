contract TestMapDeletion {
    get fun test(): Int {
         let m: map<Int, Int> = emptyMap();
         m.set(2, 200);
         // Confirm entry exists
         if(m.exists(2)) {
             // Delete the entry using set(null)
             m.set(2, null);
         }
         // Return 1 if deletion was successful
         if (!m.exists(2)) {
             return 1;
         }
         return 0;
    }
}
