contract TestMapValid {
    // This contract tests a valid map with Int keys and Int values
    get fun test(): Int {
         let m: map<Int, Int> = emptyMap();
         m.set(1, 10);
         return m.get(1)!!;
    }
}
