contract TestMapBoolFixed {
    // Testing a map with Int keys and Bool values using standard if statement
    get fun test(): Int {
         let m: map<Int, Bool> = emptyMap();
         m.set(1, true);
         if (m.get(1)!!) {
             return 1;
         } else {
             return 0;
         }
    }
}
