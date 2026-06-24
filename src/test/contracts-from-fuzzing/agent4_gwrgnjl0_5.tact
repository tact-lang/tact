contract TestMapOps {
    // Testing operations: isEmpty, exists, replace, replaceGet, and del
    get fun test(): Int {
         let m: map<Int, Int> = emptyMap();
         // Check empty
         if (!m.isEmpty()) { return 1; }
         // Set key 1
         m.set(1, 10);
         if (!m.exists(1)) { return 2; }
         // Replace value to 20
         if (!m.replace(1, 20)) { return 3; }
         // Replace and get old value, delete key by setting null
         let old: Int? = m.replaceGet(1, null);
         if (old == null || old != 20) { return 4; }
         if (m.exists(1)) { return 5; }
         // Set new key
         m.set(2, 200);
         if (!m.del(2)) { return 6; }
         if (m.exists(2)) { return 7; }
         return 0;
    }
}
