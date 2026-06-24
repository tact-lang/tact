contract TestMapReplaceGet {
    get fun test(): Int {
         let m: map<Int, Int> = emptyMap();
         m.set(5, 50);
         let old = m.replaceGet(5, null); // should delete the entry and return 50
         return old!!;
    }
}

// Expected output when invoking test(): 50